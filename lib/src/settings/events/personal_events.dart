import 'package:flutter/material.dart';
import 'package:wegift/common/widgets/common_tiles.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';
import 'package:wegift/src/settings/events/event_details_screen.dart';

class PersonalEvent extends StatelessWidget {
  const PersonalEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Events", backBtn: true),
      body: Column(
        children: [
          CommonTiles(
            text: "Birthday",
            onTileTap: () {
              Navigator.pushNamed(
                context,
                "/eventDetailsScreen",
                arguments: EventDetailsArgs(
                  title: "Birthday",
                  type: NotificationTypes.birthday,
                ),
              );
            },
            leadingIcon: null,
          ),
          CommonTiles(
            text: "Christmas",
            onTileTap: () {
              Navigator.pushNamed(context, "/eventDetailsScreen",
                  arguments: EventDetailsArgs(
                    title: "Christmas",
                    type: NotificationTypes.christmas,
                  ));
            },
            leadingIcon: null,
          ),
          CommonTiles(
            text: "Anniversary",
            onTileTap: () {
              Navigator.pushNamed(context, "/eventDetailsScreen",
                  arguments: EventDetailsArgs(
                    type: NotificationTypes.anniversary,
                    title: "Anniversary",
                  ));
            },
            leadingIcon: null,
          ),
          CommonTiles(
            text: "Valentine's Day",
            onTileTap: () {
              Navigator.pushNamed(context, "/eventDetailsScreen",
                  arguments: EventDetailsArgs(
                    type: NotificationTypes.valentines,
                    title: "Valentine's Day",
                  ));
            },
            leadingIcon: null,
          ),
          CommonTiles(
            text: "Mother's Day",
            onTileTap: () {
              Navigator.pushNamed(context, "/eventDetailsScreen",
                  arguments: EventDetailsArgs(
                    title: "Mother's Day",
                    type: NotificationTypes.mothersDay,
                  ));
            },
            leadingIcon: null,
          ),
          CommonTiles(
            text: "Father's Day",
            onTileTap: () {
              Navigator.pushNamed(context, "/eventDetailsScreen",
                  arguments: EventDetailsArgs(
                    title: "Father's Day",
                    type: NotificationTypes.fathersDay,
                  ));
            },
            leadingIcon: null,
          ),
        ],
      ),
    );
  }
}
