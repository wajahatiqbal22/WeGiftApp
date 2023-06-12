import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/filter_events/filter_events.dart';
import 'package:wegift/constants/event_dates.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/date_time_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';
import 'package:wegift/src/home/widgets/user_tiles.dart';
import 'package:wegift/src/settings/invite/invite.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Builder(builder: (context) {
            final HomeController homeCon = context.read<HomeController>();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "WeGift",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 25),
                  ),
                ),
                const Divider(thickness: 1),
                Builder(builder: (context) {
                  final currentUser =
                      context.select((AuthController con) => con.wegiftUser);

                  final notificaitonSettings =
                      context.watch<HomeController>().notificationSettings;

                  final followedUsers = context
                      .select((HomeController value) => value.followedUsers);

                  // final followedUsers =
                  //     context.watch<HomeController>().followedUsers;

                  if (followedUsers.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('No users followed yet.'),
                            ElevatedButton(
                                onPressed: () {
                                  context.toNamed(AppRouter.invite);
                                  // context.to(const InviteFriends(
                                  //     inviteBy: InviteBy.sms));
                                },
                                child: const Text('Invite friends'))
                          ],
                        ),
                      ),
                    );
                  }
                  // TODO: Turn off events wont show for individual people if turned off in their events
                  // notificaitonSettings.
                  try {
                    followedUsers.sort((a, b) => a
                        .userDetails!.birthday!.getDaysTillDate
                        .compareTo(b.userDetails!.birthday!.getDaysTillDate));
                  } catch (e) {}

                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...getUsersEvents(
                                  users: homeCon.followedUsers,
                                  notificaitonSettings: notificaitonSettings)
                              .map(
                            (e) {
                              return Column(
                                children: [
                                  UserTiles(
                                    onTap: () {
                                      context.toNamed(AppRouter.friendProfile,
                                          arguments: e.user);
                                    },
                                    events: e.eventDetail,
                                    photoUrl: e.user.userDetails?.photoUrl,
                                    name:
                                        "${e.user.firstName} ${e.user.lastName}",
                                  ),
                                ],
                              );
                            },
                          ),
                          // ...homeCon.followedUsers.map((e) {
                          //   final user = e;
                          //   // Used for getting event details for individual users
                          //   List<EventDetail> events = getFilteredEvents(
                          //       user: user,
                          //       notificaitonSettings: notificaitonSettings);
                          //   return events.isNotEmpty
                          //       ? Builder(builder: (context) {
                          //           events.sort((a, b) =>
                          //               a.eventDate.compareTo(b.eventDate));
                          //           return Column(
                          //             children: [
                          //               ...events.map((e) {
                          //                 return UserTiles(
                          //                   onTap: () {
                          //                     context.toNamed(
                          //                         AppRouter.friendProfile,
                          //                         arguments: user);
                          //                   },
                          //                   events: e,
                          //                   photoUrl:
                          //                       user.userDetails?.photoUrl,
                          //                   name:
                          //                       "${user.firstName} ${user.lastName}",
                          //                 );
                          //               }).toList(),
                          //             ],
                          //           );
                          //         })
                          //       : const SizedBox();
                          // }).toList(),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }

  List<HomeEventViewModel> getUsersEvents(
      {required List<WeGiftUser> users,
      required Map<String, dynamic> notificaitonSettings}) {
    List<HomeEventViewModel> list = [];

    for (var element in users) {
      List<EventDetail> events = getFilteredEvents(
          user: element, notificaitonSettings: notificaitonSettings);
      for (var event in events) {
        list.add(
          HomeEventViewModel(
              user: element, eventDate: event.eventDate, eventDetail: event),
        );
      }
    }
    list.sort(
        (a, b) => a.eventDetail.daysLeft.compareTo(b.eventDetail.daysLeft));
    return list;
  }
}

class HomeEventViewModel {
  final WeGiftUser user;
  final DateTime eventDate;
  final EventDetail eventDetail;
  HomeEventViewModel(
      {required this.user, required this.eventDate, required this.eventDetail});
}
