import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wegift/common/affiliate/affiliate_links.dart';
import 'package:wegift/exceptions/auth_exception/auth_exception.dart';
import 'package:wegift/extensions/date_time_extension.dart';
import 'package:wegift/extensions/list_extension.dart';
import 'package:wegift/extensions/string_extension.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/domain/services/notifiers/auth_state.dart';
import 'package:wegift/src/auth/domain/services/notifiers/username_state.dart';
import 'package:wegift/src/search/controller/search_controller.dart';

import '../../../common/utility.dart';

class RegistrationViewModel {
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  File? photoFile;
  DateTime? birthday;
  DateTime? anniversary;
  String? phoneNumber;
  String? isoCode;

  RegistrationViewModel(
      {this.anniversary,
      this.birthday,
      this.email,
      this.firstName,
      this.lastName,
      this.photoFile,
      this.phoneNumber,
      this.isoCode});

  void setDetails(
      {required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String isoCode}) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.isoCode = isoCode;
  }
}

class AuthController extends ChangeNotifier {
  AuthController(this.services, {required this.stateNotifier});

  final Bootstrap services;
  AuthState _state = const AuthState.none();
  AuthState get state => _state;

  late WeGiftUser _weGiftUser;

  get phoneNums => null;
  set wegiftUser(WeGiftUser user) {
    _weGiftUser = user;
    notifyListeners();
  }

  WeGiftUser get wegiftUser => _weGiftUser;

  RegistrationViewModel model = RegistrationViewModel();

  void Function(AuthState) stateNotifier;

  LoadingState _loadingState = LoadingState.idle;

  LoadingState get loadingState => _loadingState;

  set loadingState(LoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  Future<AuthorizationStatus> requestNotificationsPermission() async {
    return await services.authService.requestNotificationsPermission();
  }

  Wishlist assembleWishlistItem(String url) {
    final uri = Uri.parse(url);
    final wishlistId = Utility.generateId();
    final segments = uri.pathSegments;
    final asin = segments[2];
    final productImage =
        'https://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=US&ASIN=${asin}&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_';
    final title = segments.first;
    final assembledWishlist = Wishlist(
        link: affiliateUrl(url),
        id: wishlistId,
        productImage: [productImage],
        title: title.replaceAll("-", " "));

    return assembledWishlist;
  }

  Future<void> addToWishlist(
      {required Wishlist assembledWishlist, XFile? image}) async {
    String? url;
    if (image != null) {
      final snap = await FirebaseStorage.instance
          .ref("wishList/${assembledWishlist.id}/${image.name}")
          .putFile(File(image.path));
      assembledWishlist = assembledWishlist.copyWith(
        productImage: assembledWishlist.productImage != null
            ? [
                ...assembledWishlist.productImage!,
                await snap.ref.getDownloadURL()
              ]
            : [await snap.ref.getDownloadURL()],
      );
    }

    await services.userService.addToWishlist(wishlist: assembledWishlist);
    final newWishlist = {
      ...wegiftUser.wishlist,
      assembledWishlist.id: assembledWishlist
    };

    wegiftUser = wegiftUser.copyWith(wishlist: newWishlist);
  }

  Future<void> removeFromWishlist(Wishlist item) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(wegiftUser.uid)
        .update(wegiftUser.toJson());
  }

  Future<void> followUser(WeGiftUser user, {bool isUnfollowing = false}) async {
    await services.userService.followUser(
        otherUser: user, currentUser: wegiftUser, isUnfollowing: isUnfollowing);
  }

  Future<void> updateUser(WeGiftUser user,
      {File? photo,
      Function(WeGiftUser)? onSuccess,
      Function(AuthException)? onError}) async {
    try {
      loadingState = LoadingState.loading;
      wegiftUser =
          await services.userService.updateUser(user: user, photo: photo);
      onSuccess?.call(wegiftUser);
      loadingState = LoadingState.loaded;
    } catch (e) {
      loadingState = LoadingState.error;
      onError?.call(const AuthException.unknown(
          "There was en error updating your profile. Please try again."));
    }
  }

  Future<void> checkPersistance() async {
    _state = const AuthState.loggingIn(AuthType.persistance);
    notifyListeners();
    try {
      log(" IA M HERERERLKJAKLFJLKA");
      _weGiftUser = await services.authService.persistanceLogin();
      _state = AuthState.loggedIn(_weGiftUser);
      notifyListeners();
    } on AuthException catch (e) {
      log("E: $e");
      e.maybeWhen(
        docDoesNotExist: (message, code) {
          _state = const AuthState.noUser();
          stateNotifier(_state);
        },
        orElse: () {
          _state = AuthState.error(e);
          stateNotifier(_state);
        },
        userNotFound: (m, c) {
          _state = const AuthState.noUser();
        },
      );
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle({bool isFromSignup = false}) async {
    _state = const AuthState.loggingIn(AuthType.google);
    notifyListeners();
    try {
      _weGiftUser = await services.authService
          .signInWithGoogle(isFromSignup: isFromSignup);
      _state = AuthState.loggedIn(_weGiftUser);
      notifyListeners();
    } on AuthException catch (e, s) {
      e.maybeWhen(
        docDoesNotExist: (e, m) {
          _state = const AuthState.noUser();
        },
        userNotFound: (e, m) {
          _state = const AuthState.noUser();
        },
        orElse: () {
          _state = AuthState.error(e);
        },
      );
    } catch (e) {
      log(e.toString());
      _state = const AuthState.error(AuthException.unauthorized());
      //IMp
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  Future<void> lookupUsername(
      String username, Function(UsernameState state) stateNotifier) async {
    final bool isUsernamefound =
        await services.authService.lookupUsername(username);
    if (isUsernamefound) {
      stateNotifier(const UsernameState.found());
    } else {
      stateNotifier(const UsernameState.noUsername());
    }
  }

  Future<void> signInWithFacebook({bool isFromSignup = false}) async {
    _state = const AuthState.loggingIn(AuthType.facebook);

    notifyListeners();
    try {
      _weGiftUser = await services.authService
          .signInWithFacebook(isFromSignup: isFromSignup);

      _state = AuthState.loggedIn(_weGiftUser);
      notifyListeners();
    } on AuthException catch (e, s) {
      e.maybeWhen(
        userNotFound: (e, m) {
          _state = const AuthState.noUser();
        },
        orElse: () {
          _state = AuthState.error(e);
        },
      );
    } catch (e) {
      _state = const AuthState.error(AuthException.banned());
      // Imp
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  Future<void> loginWithPhoneNumber(String phoneNumber) async {
    _state = const AuthState.loggingIn(AuthType.phone);
    notifyListeners();
    try {
      await services.authService.loginWithPhoneNumber(
        phoneNumber,
        verificationCompleted: (PhoneAuthCredential credentials) {
          if (credentials.verificationId == null) {
            throw const AuthException.unknown();
          }
          _state = AuthState.otpSent(phoneNumber, credentials.verificationId!);
          stateNotifier(_state);
        },
        codeSent: (String verificationId, int? otp) {
          _state = AuthState.otpSent(phoneNumber, verificationId);
          stateNotifier(_state);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // _state = AuthState.otpSent(phoneNumber, verificationId);
          // stateNotifier(_state);
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw AuthException.invalidCode(exception.message);
        },
      );
    } on AuthException catch (e, s) {
      _state = AuthState.error(e);
      stateNotifier(_state);
    }
  }

  Future<void> verifyOtp(String verificationId, String otp) async {
    _state = const AuthState.loggingIn(AuthType.phone);
    notifyListeners();
    try {
      _weGiftUser = await services.authService
          .verifyOtp(otpCode: otp, verificationId: verificationId);
      _state = AuthState.loggedIn(_weGiftUser);
    } on AuthException catch (e, s) {
      e.maybeWhen(docDoesNotExist: (message, code) {
        _state = const AuthState.noUser();
        stateNotifier(_state);
      }, orElse: () {
        _state = AuthState.error(e);
        stateNotifier(_state);
      });
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  Future<void> signInWithApple({bool isFromSignup = false}) async {
    _state = const AuthState.loggingIn(AuthType.apple);
    notifyListeners();
    try {
      _weGiftUser = await services.authService
          .signInWithApple(isFromSignup: isFromSignup);
      _state = AuthState.loggedIn(_weGiftUser);
      notifyListeners();
    } on AuthException catch (e, s) {
      e.maybeWhen(
        docDoesNotExist: (e, m) {
          _state = const AuthState.noUser();
        },
        userNotFound: (e, m) {
          _state = const AuthState.noUser();
        },
        orElse: () {
          _state = AuthState.error(e);
        },
      );
    } catch (e) {
      _state = const AuthState.error(AuthException.unauthorized());
      //IMp
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  void dummy(AuthState state) {
    _state = state;
    notifyListeners();
    stateNotifier(_state);
  }

  Future<void> logout() async {
    await services.authService.logout();
    model = RegistrationViewModel();
    _state = const AuthState.logOut();
    stateNotifier(_state);
  }

  Future<void> deleteUser() async {
    try {
      model = RegistrationViewModel();
      await services.authService.deleteUser();
      await logout();
    } on FirebaseFunctionsException {
      rethrow;
    }
  }

  // UI Registration and Data
  RegisterState _registerState = RegisterState.name;

  List<WeGiftUser> phoneNumberUsers = [];

  DateTime? _selectedBirthDay;
  DateTime? _selectedAniversary;

  List<Contact> allContacts = List.empty(growable: true);
  ContactState _contactState = ContactState.none;
  ContactState get contactState => _contactState;
  set contactState(ContactState state) {
    _contactState = state;
    notifyListeners();
  }

  DateTime? get getSelectedBirthday => _selectedBirthDay;
  DateTime? get getSelectedAniversary => _selectedAniversary;
  RegisterState get getRegisterState => _registerState;

  set registerState(RegisterState state) {
    _registerState = state;
    notifyListeners();
  }

  void changeBirthDay(DateTime date) {
    _selectedBirthDay = date;
    notifyListeners();
  }

  void changeAniversary(DateTime date) {
    _selectedAniversary = date;
    notifyListeners();
  }

  List<dynamic> _searchedContacts = [];

  List<dynamic> get searchedContacts => _searchedContacts;

  set searchedContacts(List<dynamic> c) {
    _searchedContacts = c;
    notifyListeners();
  }

  void search(String term) {
    if (term.isEmpty) {
      searchedContacts = [...allContacts, ...phoneNumberUsers];
      return;
    }
    term = term.toLowerCase();
    bool searchHandler(dynamic element) {
      bool isFound = false;
      if (element is Contact) {
        final phone =
            (element.phones?.existsAt(0)?.value ?? "").incrementalSplit();
        final givenName = (element.displayName ?? "").incrementalSplit();
        if (givenName.contains(term) ||
            givenName.contains(term) ||
            phone.contains(term)) {
          isFound = true;
        }
      } else if (element is WeGiftUser) {
        final name =
            "${element.firstName} ${element.lastName}".incrementalSplit();
        final phone = (element.phoneNumber ?? "").incrementalSplit();
        final username = (element.username ?? "").incrementalSplit();
        if (name.contains(term) ||
            phone.contains(term) ||
            username.contains(term)) {
          isFound = true;
        }
      }

      return isFound;
    }

    final cs = searchedContacts.where(searchHandler).toList();
    searchedContacts = cs;
  }

  Future<void> initContact({bool isFromRegistration = true}) async {
    try {
      contactState = ContactState.getting;
      final permission = await Permission.contacts.request();
      if (permission.isGranted) {
        allContacts = await ContactsService.getContacts();
        if (allContacts.isEmpty) {
          _contactState = ContactState.noContacts;
        } else {
          allContacts.first;
          List phoneNums = allContacts.map((element) {
            final val = (element as Contact)
                .phones
                ?.existsAt(0)
                ?.value
                ?.replaceAll(RegExp(r"\p{P}|\s+", unicode: true), "")
                .trim();

            return val;
          }).toList();
          phoneNums = List<String>.from(phoneNums.whereType<String>()).toList();
          log("PHONE NUMS: $phoneNums");
          phoneNums = (phoneNums as List<String>).map((e) {
            return e;
            // if (e.startsWith("+1")) {
            //   return e;
            // }
            // final split = e.split("");
            // split.insert(0, "+1");

            // return split.join("");
          }).toList();
          phoneNums = phoneNums.toSet().toList();
          final contactUsers = await getUsersForContactNumbers(phoneNums);
          allContacts.removeWhere(_contactRemoveHandler);

          searchedContacts = [
            ...allContacts,
            if (isFromRegistration) ...contactUsers
          ];
          _contactState = ContactState.success;
        }
      } else {
        if (permission.isPermanentlyDenied) {
          _contactState = ContactState.denied;
        } else {
          _contactState = ContactState.denied;
        }
      }
    } catch (e) {
      log(e.toString());
      _contactState = ContactState.exception;
    } finally {
      notifyListeners();
    }
  }

  bool _contactRemoveHandler(Object contact) {
    if (contact is Contact) {
      final val = contact.phones?.first.value
              ?.replaceAll(RegExp(r"\p{P}|\s+", unicode: true), "") ??
          "";
      if (phoneNumberUsers.any((element) => element.phoneNumber == val)) {
        return true;
      }
    }
    return false;
  }

  Future<List<WeGiftUser>> getUsersForContactNumbers(
      List<String> phoneNumbers) async {
    final conts =
        await services.userService.getUsersForContactNumbers(phoneNumbers);
    phoneNumberUsers = [...conts];
    return phoneNumberUsers;
  }

  Future<void> setUserData(
      {required VoidCallback onSuccess, required VoidCallback onError}) async {
    log("MODEL FILE: ${model.photoFile}");
    try {
      final UserDetails details = UserDetails(
        firstName: model.firstName,
        lastName: model.lastName,
        email: model.email,
        birthday: model.birthday,
        anniversary: model.anniversary,
        dobAsString: model.birthday?.getDateMonthAsString(),
        aniversaryAsString: model.anniversary?.getDateMonthAsString(),
        photoUrl: await services.userService.uploadPhoto(file: model.photoFile),
      );

      _weGiftUser = _weGiftUser.copyWith(
          uid: FirebaseAuth.instance.currentUser!.uid,
          fcmToken: await FirebaseMessaging.instance.getToken(),
          email: model.email ?? "",
          firstName: model.firstName!,
          phoneNumber: model.phoneNumber,
          lastName: model.lastName!,
          username: model.username!.toLowerCase(),
          userDetails: details);
      await services.userService.setUserDetails(_weGiftUser);
      onSuccess();
    } on AuthException catch (e, s) {
      onError();
    }
  }
}

enum RegisterState {
  name,
  username,
  birthday,
  aniversary,
  profilePic,
  notifPerm,
  contactPerm,
  followContact,
  // inviteContact,
}

enum ContactState {
  none,
  getting,
  denied,
  success,
  noContacts,
  exception,
}
