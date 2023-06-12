import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wegift/constants/event_dates.dart';
import 'package:wegift/extensions/date_time_extension.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';

List<EventDetail> getFilteredEvents(
    {required WeGiftUser user,
    required Map<String, dynamic> notificaitonSettings}) {
  List<EventDetail> events = List.empty(growable: true);
  if (user.userDetails!.birthday != null &&
      notificaitonSettings[user.uid]?[NotificationTypes.birthday.name] !=
          true) {
    events.add(EventDetail(
      eventType: NotificationTypes.birthday,
      month: DateFormat.MMMM().format(user.userDetails!.birthday!),
      daysLeft: user.userDetails!.birthday!.getDaysTillDate,
      date: user.userDetails!.birthday!.day,
      eventDate: user.userDetails!.birthday!,
    ));
  }
  if (user.userDetails!.anniversary != null &&
      notificaitonSettings[user.uid]?[NotificationTypes.anniversary.name] !=
          true) {
    events.add(EventDetail(
      eventType: NotificationTypes.anniversary,
      month: DateFormat.MMMM().format(user.userDetails!.anniversary!),
      daysLeft: user.userDetails!.anniversary!.getDaysTillDate,
      date: user.userDetails!.anniversary!.day,
      eventDate: user.userDetails!.anniversary!,
    ));
  }
  if (user.userDetails!.optionalEvents[NotificationTypes.christmas] != true &&
      notificaitonSettings[user.uid]?[NotificationTypes.christmas.name] !=
          true) {
    events.add(EventDetail(
      eventType: NotificationTypes.christmas,
      month: DateFormat.MMMM()
          .format(optionalEventsDates[NotificationTypes.christmas]!),
      daysLeft:
          optionalEventsDates[NotificationTypes.christmas]!.getDaysTillDate,
      date: optionalEventsDates[NotificationTypes.christmas]!.day,
      eventDate: optionalEventsDates[NotificationTypes.christmas]!,
    ));
  }
  if (user.userDetails!.optionalEvents[NotificationTypes.valentines] != true &&
      notificaitonSettings[user.uid]?[NotificationTypes.valentines.name] !=
          true) {
    events.add(
      EventDetail(
        eventType: NotificationTypes.valentines,
        month: DateFormat.MMMM()
            .format(optionalEventsDates[NotificationTypes.valentines]!),
        daysLeft:
            optionalEventsDates[NotificationTypes.valentines]!.getDaysTillDate,
        date: optionalEventsDates[NotificationTypes.valentines]!.day,
        eventDate: optionalEventsDates[NotificationTypes.valentines]!,
      ),
    );
  }
  if (user.userDetails!.optionalEvents[NotificationTypes.mothersDay] != true &&
      notificaitonSettings[user.uid]?[NotificationTypes.mothersDay.name] !=
          true) {
    events.add(
      EventDetail(
        eventType: NotificationTypes.mothersDay,
        month: DateFormat.MMMM()
            .format(optionalEventsDates[NotificationTypes.mothersDay]!),
        daysLeft:
            optionalEventsDates[NotificationTypes.mothersDay]!.getDaysTillDate,
        date: optionalEventsDates[NotificationTypes.mothersDay]!.day,
        eventDate: optionalEventsDates[NotificationTypes.mothersDay]!,
      ),
    );
  }
  if (user.userDetails!.optionalEvents[NotificationTypes.fathersDay] != true &&
      notificaitonSettings[user.uid]?[NotificationTypes.fathersDay.name] !=
          true) {
    events.add(
      EventDetail(
        eventType: NotificationTypes.fathersDay,
        month: DateFormat.MMMM()
            .format(optionalEventsDates[NotificationTypes.fathersDay]!),
        daysLeft:
            optionalEventsDates[NotificationTypes.fathersDay]!.getDaysTillDate,
        date: optionalEventsDates[NotificationTypes.fathersDay]!.day,
        eventDate: optionalEventsDates[NotificationTypes.fathersDay]!,
      ),
    );
  }
  return events;
}

class EventDetail {
  EventDetail({
    required this.eventType,
    required this.month,
    required this.daysLeft,
    required this.date,
    required this.eventDate,
  });
  final NotificationTypes eventType;
  final String month;
  final int daysLeft;
  final int date;
  DateTime eventDate;
}
