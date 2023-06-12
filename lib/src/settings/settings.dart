import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wegift/common/widgets/buttons/common_post_login_button.dart';
import 'package:wegift/common/widgets/common_tiles.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/bottom_nav_bar/screen/app_bottom_nav.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      appBar: const CustomAppBar(title: "Settings", backBtn: true),
      body: Column(
        children: [
          CommonTiles(
            text: "Follow & Invite Friends",
            onTileTap: () {
              Navigator.pushNamed(context, '/invite');
            },
            leadingIcon: const Icon(CupertinoIcons.person_2),
          ),
          CommonTiles(
            text: "Profile Information",
            onTileTap: () {
              context.toNamed(AppRouter.profileSetting);
            },
            leadingIcon: const Icon(CupertinoIcons.person),
          ),
          CommonTiles(
              text: "Events",
              onTileTap: () {
                Navigator.pushNamed(context, '/personalEvent');
              },
              leadingIcon: const Icon(CupertinoIcons.gift)),
          CommonTiles(
            text: "Notifications",
            onTileTap: () {
              context.toNamed(AppRouter.notifications);
            },
            leadingIcon: const Icon(CupertinoIcons.bell),
          ),
          CommonTiles(
            text: "About",
            onTileTap: () {
              Navigator.pushNamed(context, '/about');
            },
            leadingIcon: const Icon(CupertinoIcons.info),
          ),
          CommonTiles(
            text: "Contact Us",
            onTileTap: () async {
              await launchUrlString("mailto:WeGiftAppHelp@gmail.com");
              // Navigator.pushNamed(context, '/contactUs');
            },
            leadingIcon: const Icon(Icons.email_outlined),
          ),
          Padding(
            padding: EdgeInsets.only(top: context.height * 0.15),
            child: CommonPostLoginButton(
              btnText: "Log out",
              borderRadius: 10,
              onTap: () async {
                context.read<HomeController>().clear();
                await context.read<AuthController>().logout();

                context.offAll(AppRouter.onboarding);
              },
            ),
          ),
        ],
      ),
    );
  }
}
