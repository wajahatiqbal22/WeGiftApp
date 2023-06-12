import 'package:wegift/src/home/model/notifications_settings.dart';

Map<NotificationTypes, DateTime> optionalEventsDates = {
  NotificationTypes.valentines: DateTime.parse("${DateTime.now().year}-02-14"),
  NotificationTypes.christmas: DateTime.parse("${DateTime.now().year}-12-25"),
  NotificationTypes.mothersDay: DateTime.parse("${DateTime.now().year}-05-14"),
  NotificationTypes.fathersDay: DateTime.parse("${DateTime.now().year}-06-18"),
};
