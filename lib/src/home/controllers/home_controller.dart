import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wegift/extensions/string_extension.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';

class HomeController extends ChangeNotifier {
  HomeController(this.service) {
    // initialize();
  }

  final Bootstrap service;
  StreamSubscription? _followedUsersSubscription;
  StreamSubscription? _followingUsersSubscription;

  int barIndex = 0;
  final pageController = PageController();

  void updateBarIndex(int index) {
    barIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

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

  Map<String, dynamic> notificationSettings = {};
  Map<String, Map<String, bool>> notificationsFrequency = {};

  Future<void> initialize() async {
    clear();
    _followedUsersSubscription =
        service.userService.getFollowedUsers().listen((event) {
      followedUsers = event;
      searchedUsers = [...followedUsers];
    });
    _followingUsersSubscription =
        service.userService.getFollowingUsers().listen((event) {
      followingUsers = event;
    });
// dummy
    getNotificationsSettings();
  }

  Future<void> getNotificationsSettings() async {
    final data = await service.userService.getNotificationsSettings();

    if (data["pauseFor"] != null) {
      notificationSettings.addEntries(data["pauseFor"].entries);
    }
    if (data["frequency"] != null) {
      notificationsFrequency.addEntries(
          Map<String, Map<String, bool>>.from(data["frequency"]).entries);
    }
    notifyListeners();
  }

  Future<void> updateNotificationSettingsForUser(
      String userId, bool value, NotificationTypes type) async {
    if (notificationSettings[userId] != null) {
      final Map<String, bool> map =
          Map<String, bool>.from(notificationSettings[userId]);

      notificationSettings[userId] = {...map, type.name: value};
    } else {
      notificationSettings[userId] = {type.name: value};
    }
    notifyListeners();
    await service.userService
        .updateNotificationSettingsForUser(userId, value, type);
  }

  Future<void> updateNotificationSettingsOnFollow({required String uid}) async {
    if (notificationSettings.containsKey(uid)) {
      notificationSettings.removeWhere((key, value) => key == uid);
      notificationSettings = {...notificationSettings};
    }
    notificationSettings = {
      ...notificationSettings,
      uid: {
        NotificationTypes.birthday.name: false,
        NotificationTypes.anniversary.name: true,
        NotificationTypes.christmas.name: false,
        NotificationTypes.mothersDay.name: true,
        NotificationTypes.fathersDay.name: true,
        NotificationTypes.valentines.name: true,
      },
    };
    await service.userService.updateNotificationSettingsOnFollow(
        notificationSettings: notificationSettings);
    notifyListeners();
  }

  Future<void> removeSettingOnUnfollow({required String uid}) async {
    if (notificationSettings.containsKey(uid)) {
      log("here om,ce");
      notificationSettings.removeWhere((key, value) => key == uid);
      notificationSettings = {...notificationSettings};
    }

    await service.userService.updateNotificationSettingsOnFollow(
        notificationSettings: notificationSettings);
    notifyListeners();
  }

  Future<void> updateNotificationFrequency(
      NotiFrequency frequency, bool value, NotificationTypes eventType) async {
    // if(notificationsFrequency[eventType]!=null){

    // }

    if (notificationsFrequency[eventType.name] != null) {
      notificationsFrequency[eventType.name]![frequency.name] = value;
    } else {
      notificationsFrequency[eventType.name] = {};
      notificationsFrequency[eventType.name]![frequency.name] = value;
    }
    // else {
    //   notificationSettings[eventType.name] = {};
    //   notificationsFrequency[eventType.name]![frequency.name] = value;
    // }

    notifyListeners();
    await service.userService
        .updateNotificationFrequency(frequency, !value, eventType);
  }

  late List<WeGiftUser> searchedUsers = [];

  void search(String term) {
    term = term.toLowerCase();
    if (term.isEmpty) {
      searchedUsers = [...followedUsers];
      notifyListeners();
      return;
    }

    searchedUsers = followedUsers.where((element) {
      final firstName = element.firstName.toLowerCase().incrementalSplit();
      final lastName = element.lastName.toLowerCase().incrementalSplit();
      final phone =
          (element.phoneNumber?.toLowerCase() ?? "").incrementalSplit();
      final username =
          (element.username?.toLowerCase() ?? "").incrementalSplit();

      if ([firstName, lastName, phone, username]
          .any((element) => element.contains(term))) {
        return true;
      }
      return false;
    }).toList();
    notifyListeners();
  }

  void clear() {
    _followedUsersSubscription?.cancel();
    _followingUsersSubscription?.cancel();
    _followedUsers.clear();
    _followingUsers.clear();
  }

  @override
  void dispose() {
    _followedUsersSubscription?.cancel();
    _followingUsersSubscription?.cancel();
    super.dispose();
  }
}
