// Project imports:
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:wegift/constants/social_auth_constants.dart';
import 'package:wegift/exceptions/auth_exception/auth_exception.dart';
import 'package:wegift/src/app/bootstrap/app_links/app_links.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';

abstract class AuthService {
  /// Checks if current user exists in the app. If exists, app should
  /// navigate to the home screen. Else, [Onboarding] screen needs to be
  /// displayed.
  Future<WeGiftUser> persistanceLogin();

  /// Signs user with email and password. Returns the [WeGiftUser] from the database.
  Future<WeGiftUser> loginWithEmailAndPassword(
      {required String email, required String password});
  // Future<WeGiftUser> signUpWithEmailAndPassword

  /// Logs in the user with a phone number. On success, must go to OTP verification screen.
  Future<void> loginWithPhoneNumber(
    String phoneNumber, {
    required PhoneAuthVerificationCompleted verificationCompleted,
    required PhoneAuthCodeSent codeSent,
    required PhoneAuthRetrievalTimeout codeAutoRetrievalTimeout,
    required PhoneAuthVerificationFailed verificationFailed,
    bool? isRetrying,
  });

  /// Verifies a received OTP from Firebase Auth to get user logged in. Returns [WeGiftUser]
  Future<WeGiftUser> verifyOtp(
      {required String otpCode, required String verificationId});

  /// Uses Google as Auth provider.
  Future<WeGiftUser> signInWithGoogle({bool isFromSignup = false});

  /// Uses Facebook as Auth provider.
  Future<WeGiftUser> signInWithFacebook({bool isFromSignup = false});

  /// Uses Apple as Auth provider.
  Future<WeGiftUser> signInWithApple({bool isFromSignup = false});

  // Logs out the user from the app
  Future<void> logout();

// Deletes user via cloud function
  Future<void> deleteUser();

  // Looks up username if exists

  Future<bool> lookupUsername(String username);

  Future<AuthorizationStatus> requestNotificationsPermission();
  Future<List<AppLinks>> getConfig();
  late User user;
}

typedef PhoneAuthVerificationCompleted = void Function(
    PhoneAuthCredential credentials);
typedef PhoneAuthVerificationFailed = void Function(
    FirebaseAuthException error);
typedef PhoneAuthCodeSent = void Function(
    String verificationId, int? forceResendingToken);
typedef PhoneAuthRetrievalTimeout = void Function(String verificationId);

class IAuthService implements AuthService {
  IAuthService(this.services);

  final Bootstrap services;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  @override
  Future<WeGiftUser> loginWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithPhoneNumber(
    String phoneNumber, {
    required PhoneAuthVerificationCompleted verificationCompleted,
    required PhoneAuthCodeSent codeSent,
    required PhoneAuthRetrievalTimeout codeAutoRetrievalTimeout,
    required PhoneAuthVerificationFailed verificationFailed,
    bool? isRetrying,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  @override
  Future<WeGiftUser> persistanceLogin() async {
    try {
      final currentUser = _firebaseAuth.currentUser;

      if (currentUser == null) {
        throw const AuthException.userNotFound('User token not found!');
      }
      return await services.userService.getCurrentUser();

      // final WeGiftUser user =
    } on FirebaseAuthException catch (e, s) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(
              e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } catch (e) {
      rethrow;
      // TODO: Implement error
    }
  }

  @override
  Future<WeGiftUser> signInWithApple({bool isFromSignup = false}) async {
    try {
      // final nonce = sha256ofString(rawNonce);
      final AuthorizationCredentialAppleID appleUser =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oAuthProvider = OAuthProvider(kAppleProvider);

      //Create OAuth credential for apple logged in token
      final OAuthCredential credential = oAuthProvider.credential(
        idToken: appleUser.identityToken,
        accessToken: appleUser.authorizationCode,
      );

      final UserCredential userCredentials =
          await _firebaseAuth.signInWithCredential(credential);
      if (isFromSignup) {
        String? name;
        if (appleUser.familyName != null && appleUser.givenName != null) {
          name = "${appleUser.givenName} ${appleUser.familyName}";
          final pref = await SharedPreferences.getInstance();
          await pref.setString(
              "appleName", "${appleUser.givenName} ${appleUser.familyName}");
        } else {
          final pref = await SharedPreferences.getInstance();
          name = pref.getString("appleName");
        }
        final firebaseUser = userCredentials.user;
        // appleUser.na
        final nameSplit = name?.split(" ");
        // final nameSplit = firebaseUser?.displayName?.split(" ");
        final Map<String, dynamic> wegiftuser = {
          "firstName": nameSplit?.elementAt(0) ?? "",
          "lastName": nameSplit?.elementAt(1) ?? "",
          "email": firebaseUser?.email ?? "",
          "uid": ""
        };
        return await services.userService
            .registerUser(user: WeGiftUser.fromJson(wegiftuser));
      }
      return await services.userService
          .getUserById(userId: userCredentials.user!.uid);
      // return authorizationCredentialAppleID.email;
    } on SignInWithAppleAuthorizationException catch (error, stacktrace) {
      switch (error.code) {
        case AuthorizationErrorCode.canceled:
          throw "User cancelled signing in with Apple";
        case AuthorizationErrorCode.failed:
          throw "Failed signing in with Apple: $error";
        default:
          throw "There was an unknown error from Apple: $error";
      }
    } on FirebaseAuthException catch (e, stk) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(
              e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WeGiftUser> signInWithFacebook({bool isFromSignup = false}) async {
    await _facebookAuth.logOut();
    final result = await _facebookAuth.login();

    if (result.status == LoginStatus.cancelled) {
      throw "cancelled_by_user";
    }
    final accessToken = result.accessToken!;

    final AuthCredential facebookAuthCred =
        FacebookAuthProvider.credential(accessToken.token);
    try {
      final userCredentials =
          await _firebaseAuth.signInWithCredential(facebookAuthCred);
      if (isFromSignup) {
        final firebaseUser = userCredentials.user;
        final nameSplit = firebaseUser?.displayName?.split(" ");
        final Map<String, dynamic> wegiftuser = {
          "firstName": nameSplit?.elementAt(0) ?? "",
          "lastName": nameSplit?.elementAt(1) ?? "",
          "email": firebaseUser?.email ?? "",
          "uid": ""
        };
        return await services.userService
            .registerUser(user: WeGiftUser.fromJson(wegiftuser));
      }
      return await services.userService
          .getUserById(userId: userCredentials.user!.uid);
    } on FirebaseException catch (e, stk) {
      log("e: $e");
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(
              e.message, e.code);
        case "credential-already-in-use":
          throw AuthException.accountExistsWithDifferentCredentials(
              e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } catch (e) {
      rethrow;
    } finally {}
  }

  @override
  Future<WeGiftUser> signInWithGoogle({bool? isFromSignup = false}) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw "cancelled_by_user";
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (isFromSignup!) {
        final nameSplit = googleUser.displayName?.split(" ");
        final Map<String, dynamic> wegiftuser = {
          "firstName": nameSplit?.elementAt(0) ?? "",
          "lastName": nameSplit?.elementAt(1) ?? "",
          "email": googleUser.email,
          "uid": ""
        };

        return await services.userService
            .registerUser(user: WeGiftUser.fromJson(wegiftuser));
      }
      return await services.userService
          .getUserById(userId: userCredential.user!.uid);
    } on FirebaseAuthException catch (e, stk) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(
              e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WeGiftUser> verifyOtp(
      {required String otpCode, required verificationId}) async {
    try {
      final PhoneAuthCredential phoneCredentials = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpCode);
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(phoneCredentials);
      final data = await services.userService
          .getUserById(userId: userCredential.user!.uid);
      log("USER: $data");
      return data;
    } on FirebaseAuthException catch (e, s) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(
              e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } on AuthException catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    await _facebookAuth.logOut();
  }

  @override
  Future<bool> lookupUsername(String username) async {
    return await services.authRepo.lookupUsername(username);
  }

  @override
  Future<AuthorizationStatus> requestNotificationsPermission() async {
    return (await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    ))
        .authorizationStatus;
  }

  @override
  Future<List<AppLinks>> getConfig() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("config")
        .doc('app_links')
        .get();
    final appLinks = List<Map<String, dynamic>>.from(snapshot.data()?["data"]);

    final links = appLinks.map((e) => AppLinks.fromJson(e)).toList();
    links.forEach((e) {
      if (e.category == Category.card) {
        log("CAT: ${e.subCategory}");
      }
    });
    return links;
  }

  @override
  User get user => _firebaseAuth.currentUser!;

  @override
  set user(User _user) {
    user = _firebaseAuth.currentUser!;
  }

  @override
  Future<void> deleteUser() async {
    try {
      await _functions
          .httpsCallable("deleteUser")
          .call({"uid": _firebaseAuth.currentUser!.uid});
    } on FirebaseFunctionsException catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
