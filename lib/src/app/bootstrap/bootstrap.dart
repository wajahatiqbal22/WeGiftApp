// Flutter imports:
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wegift/src/app/bootstrap/app_links/app_links.dart';
import 'package:wegift/src/auth/domain/repository/auth_repo.dart';
import 'package:wegift/src/auth/domain/services/auth_service.dart';
import 'package:wegift/src/auth/domain/services/user_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Bootstrap extends ChangeNotifier {
  Bootstrap() {
    getAppConfig();
    initFcm();
    authService = IAuthService(this);
    userService = IUserService();
    authRepo = IAuthRepo();
  }

  late AuthService authService;
  late AuthRepo authRepo;
  late UserService userService;

  List<AppLinks> _links = [];
  List<AppLinks> get links => _links;
  set links(List<AppLinks> links) {
    _links = links;
    notifyListeners();
  }

  bool isLoading = true;

  Future<void> getAppConfig() async {
    // links = [];
    // notifyListeners();
    try {
      isLoading = true;
      notifyListeners();
      final fcm = await FirebaseMessaging.instance.getToken();
      log(fcm.toString());
      links = await authService.getConfig();
      log(links.length.toString());
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      log(e.toString());
    }
  }

  Future<void> initFcm() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen(backgroundHandler);
  }

  Future<void> backgroundHandler(RemoteMessage message) async {
    log("Notification recieved");
    final notification = message.notification;
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: false,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      icon: const Icon(
        Icons.notifications_none,
        size: 40,
        color: Colors.white,
      ),
      title: notification?.title,
      message: notification?.body,
    ));
    Future.delayed(const Duration(seconds: 3), () {
      // snackbarController.close();
    });
  }
}
