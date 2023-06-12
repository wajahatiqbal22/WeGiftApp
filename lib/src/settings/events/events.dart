import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/extensions/notifications_extension.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';
import 'package:wegift/src/profile/widgets/event_tiles.dart';

class Events extends StatelessWidget {
  const Events({
    Key? key,
    required this.args,
  }) : super(key: key);

  final EventsArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "${args.user.firstName} ${args.user.lastName}", backBtn: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                child: Text(
                  "Notifications",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Builder(
                builder: (context) {
                  final notifications = NotificationTypes.values
                      .where((e) => e.type == NotificationNature.notifications)
                      .toList();
                  final controller = context.watch<HomeController>();

                  return Column(
                      children: notifications
                          .map((e) => EventTiles(
                                text: e.constructedName,
                                isNotifcationSection: true,
                                value:
                                    controller.notificationSettings[args.user.uid]?[e.name] == true
                                        ? false
                                        : true,
                                onChanged: (v) {
                                  controller.updateNotificationSettingsForUser(
                                      args.user.uid, !v, e);
                                },
                              ))
                          .toList());
                },
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Events",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Builder(
                builder: (context) {
                  final notifications = NotificationTypes.values
                      .where((e) => e.type == NotificationNature.events)
                      .toList();
                  final controller = context.watch<HomeController>();

                  return Column(
                      children: notifications
                          .map((e) => EventTiles(
                                text: e.constructedName,
                                isNotifcationSection: true,
                                value:
                                    controller.notificationSettings[args.user.uid]?[e.name] == true
                                        ? false
                                        : true,
                                onChanged: (v) {
                                  controller.updateNotificationSettingsForUser(
                                      args.user.uid, !v, e);
                                },
                              ))
                          .toList());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventsArgs {
  final WeGiftUser user;

  EventsArgs(this.user);
}
