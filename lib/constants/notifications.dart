import 'package:wegift/extensions/notifications_extension.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';

List<NotificationTypes> get notificationEvents =>
    NotificationTypes.values.where((e) => e.type == NotificationNature.events).toList();

List<NotificationTypes> get optionalEvents {
  return [NotificationTypes.fathersDay, NotificationTypes.mothersDay, NotificationTypes.valentines];
}
