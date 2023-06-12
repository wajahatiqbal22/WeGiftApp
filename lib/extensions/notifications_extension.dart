import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';

extension NotificationTypesExtension on NotificationTypes {
  NotificationNature get type {
    switch (this) {
      case NotificationTypes.all:
        return NotificationNature.all;
      case NotificationTypes.birthday:
      case NotificationTypes.christmas:
      case NotificationTypes.anniversary:
      case NotificationTypes.valentines:
      case NotificationTypes.mothersDay:
      case NotificationTypes.fathersDay:
        return NotificationNature.events;

      case NotificationTypes.push:
      case NotificationTypes.email:
      case NotificationTypes.textMessage:
        return NotificationNature.notifications;
    }
  }

  List<NotificationTypes> get notifications {
    return NotificationTypes.values
        .where((e) => e.type == NotificationNature.notifications)
        .toList();
  }

  String get constructedName {
    switch (this) {
      case NotificationTypes.all:
        return "All";
      case NotificationTypes.birthday:
        return "Birthday";
      case NotificationTypes.christmas:
        return "Christmas";
      case NotificationTypes.anniversary:
        return "Anniversary";
      case NotificationTypes.valentines:
        return "Valentine's Day";
      case NotificationTypes.mothersDay:
        return "Mother's Day";
      case NotificationTypes.fathersDay:
        return "Father's Day";
      case NotificationTypes.push:
        return "Push";
      case NotificationTypes.email:
        return "Email";
      case NotificationTypes.textMessage:
        return "Text Message";
    }
  }

  Icon get getEventIcon {
    switch (this) {
      case NotificationTypes.birthday:
        return const Icon(
          CupertinoIcons.gift,
          color: Colors.blue,
          size: 35,
        );
      case NotificationTypes.christmas:
        return const Icon(
          FontAwesomeIcons.tree,
          color: Colors.green,
          size: 35,
        );
      case NotificationTypes.anniversary:
        return const Icon(
          CupertinoIcons.heart,
          color: Colors.red,
          size: 35,
        );
      case NotificationTypes.valentines:
        return const Icon(
          CupertinoIcons.heart,
          color: Colors.red,
          size: 35,
        );
      case NotificationTypes.mothersDay:
        return const Icon(
          FontAwesomeIcons.female,
          color: Colors.pink,
          size: 35,
        );
      case NotificationTypes.fathersDay:
        return const Icon(
          FontAwesomeIcons.hammer,
          color: Colors.blue,
          size: 35,
        );
      default:
        return const Icon(
          CupertinoIcons.add,
          color: Colors.blue,
          size: 35,
        );
    }
  }

  List<NotiFrequency> getNotificationFreqs() {
    List<NotiFrequency> list = [];
    if (this == NotificationTypes.birthday) {
      list = [
        NotiFrequency.sameDay,
        NotiFrequency.twoDay,
        NotiFrequency.fiveDays,
        NotiFrequency.oneWeek,
        NotiFrequency.twoWeeks,
        NotiFrequency.threeWeeks,
        NotiFrequency.oneMonth,
      ];
    }
    if (this == NotificationTypes.anniversary) {
      list = [
        NotiFrequency.sameDay,
        NotiFrequency.twoDay,
        NotiFrequency.fiveDays,
        NotiFrequency.oneWeek,
        NotiFrequency.twoWeeks,
        NotiFrequency.threeWeeks,
        NotiFrequency.oneMonth,
      ];
    }
    if (this == NotificationTypes.christmas) {
      list = [
        NotiFrequency.sameDay,
        NotiFrequency.twoDay,
        NotiFrequency.fiveDays,
        NotiFrequency.oneWeek,
        NotiFrequency.twoWeeks,
        NotiFrequency.threeWeeks,
        NotiFrequency.oneMonth,
      ];
    }
    if (this == NotificationTypes.valentines) {
      list = [
        NotiFrequency.sameDay,
        NotiFrequency.twoDay,
        NotiFrequency.fiveDays,
        NotiFrequency.oneWeek,
        NotiFrequency.twoWeeks,
      ];
    }
    if (this == NotificationTypes.mothersDay) {
      list = [
        NotiFrequency.sameDay,
        NotiFrequency.twoDay,
        NotiFrequency.fiveDays,
        NotiFrequency.oneWeek,
        NotiFrequency.twoWeeks,
      ];
    }
    if (this == NotificationTypes.fathersDay) {
      list = [
        NotiFrequency.sameDay,
        NotiFrequency.twoDay,
        NotiFrequency.fiveDays,
        NotiFrequency.oneWeek,
        NotiFrequency.twoWeeks,
      ];
    }
    return list;
  }
}

extension NotiFrequencyNotification on NotiFrequency {
  String get constructedName {
    switch (this) {
      case NotiFrequency.oneMonth:
        return "One Month Notification";
      case NotiFrequency.threeWeeks:
        return "Three Weeks Notification";
      case NotiFrequency.twoWeeks:
        return "Two Weeks Notification";
      case NotiFrequency.oneWeek:
        return "One Week Notification";
      case NotiFrequency.fiveDays:
        return "Five Days Notification";
      case NotiFrequency.twoDay:
        return "Two Days Notification";
      case NotiFrequency.sameDay:
        return "On today Notification";
    }
  }
}
