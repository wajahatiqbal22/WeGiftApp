// Project imports:
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wegift/exceptions/auth_exception/auth_exception.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/domain/repository/user_repo.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';

abstract class UserService {
  Future<WeGiftUser> getCurrentUser();
  Future<WeGiftUser> getUserById({required String userId});
  Future<List<WeGiftUser>> getListOfUsersByIds({required List<String> userIds});
  Future<WeGiftUser> updateUser({required WeGiftUser user, File? photo});
  Future<WeGiftUser> registerUser({required WeGiftUser user});
  Future<String?> uploadPhoto({File? file});
  Future<WeGiftUser> setUserDetails(WeGiftUser user);

  Stream<List<WeGiftUser>> getFollowedUsers();
  Stream<List<WeGiftUser>> getFollowingUsers();
  Future<List<WeGiftUser>> getAllUsers({required int limit});
  Future<void> followUser(
      {required WeGiftUser otherUser,
      required WeGiftUser currentUser,
      bool isUnfollowing = false});
  Future<List<WeGiftUser>> getUsersForContactNumbers(List<String> phoneNumbers);

  Future<List<WeGiftUser>> searchUsers(String searchTerm);
  Future<Wishlist> addToWishlist({required Wishlist wishlist});

  Future<void> updateNotificationSettingsForUser(
      String userId, bool value, NotificationTypes type);
  Future<void> updateNotificationFrequency(
      NotiFrequency frequency, bool value, NotificationTypes type);
  Future<Map<String, dynamic>> getNotificationsSettings();
  Future<void> updateNotificationSettingsOnFollow(
      {required Map<String, dynamic> notificationSettings});
}

class IUserService implements UserService {
  final UserRepo _repo = IUserRepo();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<WeGiftUser> getCurrentUser() async {
    try {
      final data = await _repo.getCurrentUser();

      return WeGiftUser.fromJson(data);
    } on AuthException catch (e, s) {
      log("ERROROORIJO: $e");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<WeGiftUser>> getListOfUsersByIds(
      {required List<String> userIds}) async {
    try {
      final List<Map<String, dynamic>> data =
          await _repo.getListOfUsersByIds(userIds: userIds);
      return data.map((e) => WeGiftUser.fromJson(e)).toList();
    } on FirebaseException catch (e, s) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WeGiftUser> getUserById({required String userId}) async {
    try {
      final data = await _repo.getUserById(userId: userId);

      return WeGiftUser.fromJson(data);
    } on FirebaseException catch (e, s) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WeGiftUser> updateUser({required WeGiftUser user, File? photo}) async {
    return WeGiftUser.fromJson(
        await _repo.updateUser(user: user, photo: photo));
  }

  @override
  Future<WeGiftUser> registerUser({required WeGiftUser user}) async {
    return WeGiftUser.fromJson(await _repo.registerUser(user: user));
  }

  @override
  Future<String?> uploadPhoto({File? file}) async {
    return await _repo.uploadPhoto(file: file);
  }

  @override
  Future<WeGiftUser> setUserDetails(WeGiftUser user) async {
    final data = await _repo.setUserDetails(user);

    return WeGiftUser.fromJson(data);
  }

  @override
  Stream<List<WeGiftUser>> getFollowedUsers() {
    return _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("followedUsers")
        .snapshots()
        .map((event) =>
            [for (final doc in event.docs) WeGiftUser.fromJson(doc.data())]);
  }

  @override
  Stream<List<WeGiftUser>> getFollowingUsers() {
    return _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("followingUsers")
        .snapshots()
        .map((event) =>
            [for (final doc in event.docs) WeGiftUser.fromJson(doc.data())]);
  }

  @override
  Future<List<WeGiftUser>> getAllUsers({required int limit}) async {
    final snapshot = await _firestore.collection("users").limit(limit).get();

    final users =
        snapshot.docs.map((e) => WeGiftUser.fromJson(e.data())).toList();

    users.removeWhere(
        (element) => element.uid == FirebaseAuth.instance.currentUser!.uid);
    users.forEach((element) {
      log(element.uid);
    });
    return users;
  }

  @override
  Future<void> followUser(
      {required WeGiftUser otherUser,
      required WeGiftUser currentUser,
      bool isUnfollowing = false}) async {
    final batch = _firestore.batch();
    if (isUnfollowing) {
      batch.delete(
        _firestore
            .collection("users")
            .doc(currentUser.uid)
            .collection("followedUsers")
            .doc(otherUser.uid),
      );
      batch.delete(
        _firestore
            .collection("users")
            .doc(otherUser.uid)
            .collection("followingUsers")
            .doc(currentUser.uid),
      );
    } else {
      batch.set(
          _firestore
              .collection("users")
              .doc(currentUser.uid)
              .collection("followedUsers")
              .doc(otherUser.uid),
          otherUser.toJson());
      batch.set(
          _firestore
              .collection("users")
              .doc(otherUser.uid)
              .collection("followingUsers")
              .doc(currentUser.uid),
          currentUser.toJson());
    }

    await batch.commit();
  }

  @override
  Future<List<WeGiftUser>> getUsersForContactNumbers(
      List<String> phoneNumbers) async {
    try {
      if (phoneNumbers.isEmpty) return [];
      List<WeGiftUser> users = [];

      for (String phone in phoneNumbers) {
        final snapshot = await _firestore
            .collection("users")
            .where("phoneNumber", isEqualTo: phone)
            .limit(1)
            .get();
        if (snapshot.docs.isNotEmpty) {
          log("HERE");
          users.add(WeGiftUser.fromJson(snapshot.docs.first.data()));
        }
      }
      // return await phoneNumbers.map((e)  {
      //   final snapshot = await _firestore
      //       .collection("users")
      //       .where("phoneNumber", whereIn: phoneNumbers)
      //       .get();
      //   return WeGiftUser.fromJson(snapshot.docs.first.data());
      // }).toList();
      log("USers $users");
      return users;
    } catch (e) {
      log(e.toString());

      rethrow;
    }

    // return snapshot.docs.map((e) => WeGiftUser.fromJson(e.data())).toList();
  }

  @override
  Future<List<WeGiftUser>> searchUsers(String searchTerm) async {
    final snapshot = await _firestore
        .collection("users")
        .where("search", arrayContains: searchTerm)
        .get();
    return snapshot.docs.map((e) => WeGiftUser.fromJson(e.data())).toList();
  }

  @override
  Future<Wishlist> addToWishlist({required Wishlist wishlist}) async {
    await _firestore.collection("users").doc(_auth.currentUser!.uid).update({
      "wishlist.${wishlist.id}": wishlist.toJson(),
    });
    return wishlist;
  }

  @override
  Future<void> updateNotificationSettingsForUser(
      String userId, bool value, NotificationTypes type) async {
    await _firestore
        .collection("notifications_settings")
        .doc(_auth.currentUser!.uid)
        .set({
      "pauseFor": {
        userId: {type.name: value}
      },
    }, SetOptions(merge: true));
  }

  @override
  Future<Map<String, dynamic>> getNotificationsSettings() async {
    final snapshot = await _firestore
        .collection("notifications_settings")
        .doc(_auth.currentUser!.uid)
        .get();
    return snapshot.data() ?? {};
  }

  @override
  Future<void> updateNotificationFrequency(
      NotiFrequency frequency, bool value, NotificationTypes type) async {
    await _firestore
        .collection("notifications_settings")
        .doc(_auth.currentUser!.uid)
        .set({
      "frequency": {
        type.name: {frequency.name: value}
      }
    }, SetOptions(merge: true));
  }

  @override
  Future<void> updateNotificationSettingsOnFollow(
      {required Map<String, dynamic> notificationSettings}) async {
    await _firestore
        .collection("notifications_settings")
        .doc(_auth.currentUser!.uid)
        .set({"pauseFor": notificationSettings}, SetOptions(merge: true));
  }
}
