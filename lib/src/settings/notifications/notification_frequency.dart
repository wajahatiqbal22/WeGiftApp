import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/notifications_extension.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';
import 'package:wegift/src/profile/widgets/tiles_with_toggler.dart';

class NotificationFrequency extends StatelessWidget {
  const NotificationFrequency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final controller = context.watch<HomeController>();
      return Scaffold(
        appBar: const CustomAppBar(
          title: "Notification Frequency",
          backBtn: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Builder(builder: (context) {
            final List<NotificationTypes> types = [
              NotificationTypes.birthday,
              NotificationTypes.anniversary,
              NotificationTypes.christmas,
              NotificationTypes.valentines,
              NotificationTypes.mothersDay,
              NotificationTypes.fathersDay,
            ];
            return ListView.builder(
              itemCount: types.length,
              itemBuilder: (context, index1) {
                final notificationFreq = types[index1].getNotificationFreqs();

                return Column(
                  children: [
                    ListTile(
                      title: Text(types[index1].constructedName),
                      onTap: () {
                        context.to(NotificationFrequencyBasedEvent(
                          notificationFreq: notificationFreq,
                          types: types,
                          controller: controller,
                          index1: index1,
                        ));
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          }),
        ),
      );
    });
  }
}

class NotificationFrequencyBasedEvent extends StatelessWidget {
  const NotificationFrequencyBasedEvent({
    super.key,
    required this.notificationFreq,
    required this.types,
    required this.controller,
    required this.index1,
  });

  final List<NotiFrequency> notificationFreq;
  final List<NotificationTypes> types;
  final HomeController controller;
  final int index1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        final controller = context.watch<HomeController>();
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notificationFreq.length,
            itemBuilder: (context, index2) {
              // List<NotiFrequency> filteredNotificationFreq = [];
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      index2 == 0
                          ? Column(
                              children: [
                                SizedBox(
                                  width: context.width,
                                ),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          icon: const Icon(Icons.chevron_left)),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text(
                                          types[index1].name.toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider()
                              ],
                            )
                          : const SizedBox(),
                      TilesWithToggler(
                        noVerticalPadding: true,
                        name: notificationFreq[index2].constructedName,
                        initialValue: controller.notificationsFrequency
                                .containsKey(types[index1].name) &&
                            controller
                                .notificationsFrequency[types[index1].name]!
                                .containsKey(notificationFreq[index2].name) &&
                            controller.notificationsFrequency[types[index1]
                                .name]![notificationFreq[index2].name] as bool,
                        userName: null,
                        isLeadingRequired: false,
                        onChanged: (v) {
                          controller.updateNotificationFrequency(
                              notificationFreq[index2], v, types[index1]);
                        },
                      ),
                    ],
                  ));
            });
      }),
    );
  }
}


// NotiFrequency.values
//                     .map((e) => TilesWithToggler(
//                           onChanged: (v) {
//                             controller.updateNotificationFrequency(e, v);
//                           },
//                           initialValue: controller.notificationsFrequency.containsKey(e.name) &&
//                               controller.notificationsFrequency[e.name] as bool,
//                           name: e.constructedName,
//                           userName: null,
//                           isLeadingRequired: false,
//                         ))
//                     .toList()