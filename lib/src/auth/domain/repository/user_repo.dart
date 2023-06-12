import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:wegift/exceptions/auth_exception/auth_exception.dart';
import 'package:wegift/extensions/string_extension.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';

abstract class UserRepo {
  Future<Map<String, dynamic>> getCurrentUser();
  Future<Map<String, dynamic>> getUserById({required String userId});
  Future<List<Map<String, dynamic>>> getListOfUsersByIds(
      {required List<String> userIds});
  Future<Map<String, dynamic>> updateUser(
      {required WeGiftUser user, File? photo});
  Future<Map<String, dynamic>> registerUser({required WeGiftUser user});
  Future<String?> uploadPhoto({File? file});
  Future<Map<String, dynamic>> setUserDetails(WeGiftUser user);
}

class IUserRepo implements UserRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CollectionReference<WeGiftUser> get _usersRef => _firestore
          .collection('users')
          .withConverter<WeGiftUser>(fromFirestore: (snapshot, _) {
        return WeGiftUser.fromJson(snapshot.data()!);
      }, toFirestore: (WeGiftUser user, _) {
        return {};
      });
  DocumentReference<WeGiftUser> _userDocRef(String id) => _firestore
          .collection('users')
          .doc(id)
          .withConverter<WeGiftUser>(fromFirestore: (snapshot, _) {
        return WeGiftUser.fromJson(snapshot.data()!);
      }, toFirestore: (WeGiftUser user, _) {
        return {};
      });

  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<Map<String, dynamic>> getCurrentUser() async {
    final currentUser = _firebaseAuth.currentUser;

    try {
      final doc =
          await _firestore.collection('users').doc(currentUser!.uid).get();
      if (doc.exists) {
        final fcmToken = await _messaging.getToken();
        await _firestore
            .collection("users")
            .doc(currentUser.uid)
            .update({"fcmToken": fcmToken});

        return doc.data()!;
      } else {
        throw const AuthException.docDoesNotExist();
      }
    } on FirebaseException catch (e, s) {
      log("ERRODIF FRIEB REPO: $e");
      rethrow;
    } catch (e) {
      log("ERRODIF FRIEB CATCH: $e");
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getListOfUsersByIds(
      {required List<String> userIds}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection("users")
          .where(FieldPath.documentId, whereIn: userIds)
          .get();
      final List<Map<String, dynamic>> data =
          snapshot.docs.map((e) => e.data()).toList();
      return data;
    } on FirebaseException catch (e, s) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getUserById({required String userId}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection("users").doc(userId).get();

      if (snapshot.data() == null) throw const AuthException.docDoesNotExist();
      final fcmToken = await _messaging.getToken();

      await _firestore
          .collection("users")
          .doc(userId)
          .update({"fcmToken": fcmToken});
      return snapshot.data()!;
    } on FirebaseException catch (e, s) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateUser(
      {required WeGiftUser user, File? photo}) async {
    log("PHOTO: $photo");
    if (photo != null) {
      user = user.copyWith(
          userDetails: user.userDetails
              ?.copyWith(photoUrl: await uploadPhoto(file: photo)));
    }
    await _firestore.collection("users").doc(user.uid).update(user.toJson());
    return user.toJson();
  }

  @override
  Future<Map<String, dynamic>> registerUser({required WeGiftUser user}) async {
    final snapshot =
        await _firestore.collection("users").doc(currentUser?.uid).get();
    final values = NotiFrequency.values.map((e) => MapEntry(e, true));
    if (snapshot.data() == null) {
      user = user.copyWith(uid: currentUser!.uid);
      await _firestore.collection("users").doc(user.uid).set(user.toJson());
      final fcmToken = await _messaging.getToken();

      await _firestore
          .collection("users")
          .doc(user.uid)
          .update({"fcmToken": fcmToken});
      _firestore.collection("notifications_settings").doc(user.uid).set({
        "frequency": Map.fromEntries(
            NotiFrequency.values.map((e) => MapEntry(e.name, true))),
      });
      return user.toJson();
    } else {
      return snapshot.data()!;
    }
  }

  @override
  Future<String?> uploadPhoto({File? file}) async {
    log("FILE: $file");
    // ignore: null_argument_to_non_null_type
    try {
      if (file == null) return Future.value(null);

      final ref = _storage.ref(
          'profile_photos/${_firebaseAuth.currentUser!.uid}/${_firebaseAuth.currentUser!.uid}');

      final snapshot = await ref.putFile(file);

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      log("ERROR: $e");
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>> setUserDetails(WeGiftUser user) async {
    await _firestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .set({
      ...user.toJson(),
      "search": [
        for (final i in [user.firstName, user.lastName, user.username!])
          ...i.toLowerCase().incrementalSplit()
      ],
    }, SetOptions(merge: true));
    await _firestore
        .collection("username")
        .doc(_firebaseAuth.currentUser!.uid)
        .set({"username": user.username?.toLowerCase()});
    return user.toJson();
  }
}
