import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/common/widgets/search_field.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';
import 'package:wegift/src/profile/widgets/tiles_with_toggler.dart';

class NotificationsToggler extends StatelessWidget {
  NotificationsToggler({
    Key? key,
    required this.args,
  }) : super(key: key);

  final NotificationsTogglerArgs args;

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final controller = context.watch<HomeController>();
      return Scaffold(
        appBar: CustomAppBar(
          title: args.screenTitle,
          backBtn: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: SearchField(
                controller: searchController,
                isTextCentered: true,
                onChanged: (v) {
                  controller.search(v);
                },
              ),
            ),
            TilesWithToggler(
              onChanged: (v) async {
                for (final user in controller.searchedUsers) {
                  controller.updateNotificationSettingsForUser(user.uid, v, args.type);
                }
              },
              initialValue: controller.searchedUsers.every((element) =>
                      controller.notificationSettings.containsKey(element.uid) &&
                      (controller.notificationSettings[element.uid]?[args.type.name] ?? false)) &&
                  controller.searchedUsers.isNotEmpty,
              name: "Pause All",
              userName: null,
              icon: const Icon(
                CupertinoIcons.bell,
                size: 70,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Builder(builder: (context) {
                return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: controller.searchedUsers.length,
                  itemBuilder: (context, index) {
                    final user = controller.searchedUsers[index];
                    return TilesWithToggler(
                      initialValue:
                          controller.notificationSettings[user.uid]?[args.type.name] ?? false,
                      onChanged: (v) async {
                        await controller.updateNotificationSettingsForUser(user.uid, v, args.type);
                      },
                      profileUrl: user.userDetails!.photoUrl,
                      name: "${user.firstName} ${user.lastName}",
                      userName: user.username!,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}

class NotificationsTogglerArgs {
  final String screenTitle;
  final NotificationTypes type;

  NotificationsTogglerArgs({required this.screenTitle, required this.type});
}
