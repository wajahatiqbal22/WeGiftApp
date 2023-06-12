import 'package:flutter/material.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';

class SearchController extends ChangeNotifier {
  SearchController(this.services) {
    _initialize();
  }

  final Bootstrap services;

  LoadingState _state = LoadingState.idle;
  LoadingState get state => _state;
  set state(LoadingState st) {
    _state = st;
    notifyListeners();
  }

  List<WeGiftUser> _users = [];
  List<WeGiftUser> get users => _users;
  set users(List<WeGiftUser> giftusers) {
    _users = [...giftusers];
    notifyListeners();
  }

  List<WeGiftUser> _searchedUsers = [];
  List<WeGiftUser> get searchedUsers => _searchedUsers;
  set searchedUsers(List<WeGiftUser> giftusers) {
    _searchedUsers = [...giftusers];
    notifyListeners();
  }

  Future<void> _initialize() async {
    state = LoadingState.loading;
    users = await services.userService.getAllUsers(limit: 30);

    searchedUsers = users;
    state = LoadingState.loaded;
  }

  Future<void> followUser(WeGiftUser user,
      {required WeGiftUser currentUser, bool isUnfollowing = false}) async {
    await services.userService.followUser(
        otherUser: user,
        currentUser: currentUser,
        isUnfollowing: isUnfollowing);
  }

  void search(String v) async {
    if (v.isEmpty) {
      searchedUsers = users;
      return;
    }
    searchedUsers = await services.userService.searchUsers(v);
  }
}

enum LoadingState { loading, loaded, error, idle }
