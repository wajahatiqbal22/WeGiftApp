import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';

class FriendsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<WeGiftUser>> getFriendFollowers(String userId) async {
    final snapshot =
        await _firestore.collection("users").doc(userId).collection("followingUsers").get();

    return snapshot.docs.map((e) => WeGiftUser.fromJson(e.data())).toList();
  }

  Future<List<WeGiftUser>> getFriendFollowings(String userId) async {
    final snapshot =
        await _firestore.collection("users").doc(userId).collection("followedUsers").get();

    return snapshot.docs.map((e) => WeGiftUser.fromJson(e.data())).toList();
  }

  Future<void> reserveWishlistItem(Wishlist item, WeGiftUser owner) async {
    await _firestore
        .collection("users")
        .doc(owner.uid)
        .update({"wishlist.${item.id}": item.toJson()});
  }
}
