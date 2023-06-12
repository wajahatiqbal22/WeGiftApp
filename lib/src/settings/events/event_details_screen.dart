import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/common/widgets/search_field.dart';
import 'package:wegift/extensions/string_extension.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';
import 'package:wegift/src/profile/widgets/tiles_with_toggler.dart';

class EventDetailScreen extends StatefulWidget {
  EventDetailScreen({
    Key? key,
    required this.args,
  }) : super(key: key);
  final EventDetailsArgs args;

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final TextEditingController searchController = TextEditingController();
  List<WeGiftUser> searchedUsers = [];
  List<WeGiftUser> usersAccordingToType = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.args.title,
        backBtn: true,
        elevation: 0,
      ),
      body: Builder(builder: (context) {
        final controller = context.watch<HomeController>();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: SearchField(
                controller: searchController,
                isTextCentered: true,
                onChanged: (v) {
                  search(v);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  Text("Turn on ${widget.args.title} events for"),
                ],
              ),
            ),
            Builder(builder: (context) {
              final allUsers = controller.followedUsers;
              switch (widget.args.type) {
                case NotificationTypes.all:
                  break;
                case NotificationTypes.birthday:
                  usersAccordingToType = allUsers
                      .where((element) => element.userDetails!.birthday != null)
                      .toList();

                  break;
                case NotificationTypes.christmas:
                  usersAccordingToType = [...allUsers];

                  break;
                case NotificationTypes.anniversary:
                  usersAccordingToType = (allUsers.where((element) =>
                      element.userDetails!.anniversary != null)).toList();

                  break;
                case NotificationTypes.valentines:
                  usersAccordingToType = [...allUsers];
                  break;
                case NotificationTypes.mothersDay:
                  usersAccordingToType = [...allUsers];

                  break;
                case NotificationTypes.fathersDay:
                  usersAccordingToType = [...allUsers];

                  break;
                default:
                  break;
              }

              if (searchController.text.isEmpty) {
                searchedUsers = [...allUsers];
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: searchedUsers.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final user = searchedUsers[index];
                    return TilesWithToggler(
                      //TODO: Inverse
                      initialValue:
                          controller.notificationSettings[user.uid] != null &&
                                  controller.notificationSettings[user.uid]
                                          [widget.args.type.name] !=
                                      null
                              ? !controller.notificationSettings[user.uid]
                                  [widget.args.type.name]
                              : false,
                      onChanged: (v) async {
                        await controller.updateNotificationSettingsForUser(
                            user.uid, !v, widget.args.type);
                      },
                      profileUrl: user.userDetails!.photoUrl,
                      name: "${user.firstName} ${user.lastName}",
                      userName: user.username!,
                    );
                  },
                ),
              );
            }),
          ],
        );
      }),
    );
  }

  void search(String term) {
    term = term.toLowerCase();
    setState(() {
      searchedUsers = usersAccordingToType.where((element) {
        final firstName = element.firstName.toLowerCase().incrementalSplit();
        final lastName = element.lastName.toLowerCase().incrementalSplit();
        final phone =
            (element.phoneNumber?.toLowerCase() ?? "").incrementalSplit();
        final username =
            (element.username?.toLowerCase() ?? "").incrementalSplit();

        if ([firstName, lastName, phone, username]
            .any((element) => element.contains(term))) {
          return true;
        }
        return false;
      }).toList();
    });
  }
}

class EventDetailsArgs {
  final String title;
  final NotificationTypes type;

  EventDetailsArgs({
    required this.title,
    required this.type,
  });
}
