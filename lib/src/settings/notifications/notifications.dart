import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wegift/common/widgets/common_tiles.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';
import 'package:wegift/src/settings/notifications/notifications_toggler.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Notifications", backBtn: true),
      body: Column(
        children: [
          CommonTiles(
            text: "Push",
            onTileTap: () {
              context.toNamed(AppRouter.notificationsToggler,
                  arguments: NotificationsTogglerArgs(
                    screenTitle: "Push Notifications",
                    type: NotificationTypes.push,
                  ));
            },
            leadingIcon: const Icon(CupertinoIcons.bell),
          ),
          CommonTiles(
            text: "SMS",
            onTileTap: () {
              context.toNamed(AppRouter.notificationsToggler,
                  arguments: NotificationsTogglerArgs(
                    screenTitle: "SMS",
                    type: NotificationTypes.textMessage,
                  ));
            },
            leadingIcon: const Icon(CupertinoIcons.chat_bubble_text),
          ),
          CommonTiles(
            text: "Email",
            onTileTap: () {
              context.toNamed(AppRouter.notificationsToggler,
                  arguments: NotificationsTogglerArgs(
                    screenTitle: "Email",
                    type: NotificationTypes.email,
                  ));
            },
            leadingIcon: const Icon(Icons.email_outlined),
          ),
          CommonTiles(
            text: "Frequency",
            onTileTap: () {
              Navigator.pushNamed(context, '/notificationFrequency');
            },
            leadingIcon: const Icon(CupertinoIcons.alarm),
          ),
        ],
      ),
    );
  }
}
