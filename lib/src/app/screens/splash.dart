import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.read<AuthController>().checkPersistance();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (context) {
        context.read<AuthController>().stateNotifier = (state) {
          state.maybeWhen(
            loggedIn: (user) {
              context.read<HomeController>().initialize();
              print("USER: $user");
              if (user.userDetails != null) {
                context.off(AppRouter.mainPageView);
              } else {
                context.off(AppRouter.registration);
              }
            },
            logOut: () {
              context.off(AppRouter.onboarding);
              // context.read<HomeController>().clear();
            },
            error: (e) {
              context.off(AppRouter.onboarding);
            },
            noUser: () {
              final currentUser = FirebaseAuth.instance.currentUser;
              if (currentUser != null) {
                context.read<AuthController>().wegiftUser = WeGiftUser(
                    email: "",
                    firstName: "",
                    lastName: "",
                    phoneNumber: currentUser.phoneNumber,
                    uid: FirebaseAuth.instance.currentUser!.uid);
                context.off(AppRouter.registration);
              } else {
                context.off(AppRouter.onboarding);
              }
            },
            orElse: () {},
          );
        };
        return Center(
          child: Text(
            'WeGift',
            style: context.textTheme.headline4,
          ),
        );
      },
    ));
  }
}
