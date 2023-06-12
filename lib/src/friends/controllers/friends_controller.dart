import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/friends/services/friends_service.dart';
import 'package:wegift/src/search/controller/search_controller.dart';

class FriendsController extends ChangeNotifier {
  final Bootstrap services;
  final WeGiftUser friend;
  final FriendsService _repo = FriendsService();

  FriendsController(this.services, {required this.friend}) {
    _initialize(friend.uid);
  }

  Future<void> _initialize(String friendId) async {
    followedUsers = await _repo.getFriendFollowings(friendId);
    followingUsers = await _repo.getFriendFollowers(friendId);
  }

  LoadingState state = LoadingState.idle;

  List<WeGiftUser> _followedUsers = [];

  List<WeGiftUser> get followedUsers => _followedUsers;
  set followedUsers(List<WeGiftUser> users) {
    _followedUsers = [...users];
    notifyListeners();
  }

  List<WeGiftUser> _followingUsers = [];

  List<WeGiftUser> get followingUsers => _followingUsers;
  set followingUsers(List<WeGiftUser> users) {
    _followingUsers = [...users];
    notifyListeners();
  }

  Future<void> followUser(WeGiftUser user,
      {required WeGiftUser currentUser, bool isUnfollowing = false}) async {
    await services.userService
        .followUser(otherUser: user, currentUser: currentUser, isUnfollowing: isUnfollowing);
  }

  Future<void> reserveWishlistItem({
    required Wishlist item,
    required WeGiftUser owner,
    Function(Wishlist)? onSuccess,
    Function()? onError,
    bool unreserving = false,
  }) async {
    item = item.copyWith(
        reservedBy: unreserving ? null : FirebaseAuth.instance.currentUser?.uid,
        isReserved: unreserving ? false : true);
    try {
      await _repo.reserveWishlistItem(item, owner);
      onSuccess?.call(item);
    } catch (e) {
      onError?.call();
    }
  }
}
