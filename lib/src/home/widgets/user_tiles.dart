import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegift/common/filter_events/filter_events.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/notifications_extension.dart';

class UserTiles extends StatelessWidget {
  const UserTiles({
    Key? key,
    required this.name,
    required this.events,
    this.onTap,
    this.photoUrl,
  }) : super(key: key);

  final String name;
  final EventDetail events;
  final String? photoUrl;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    log(events.daysLeft.toString());
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  photoUrl != null ? Colors.transparent : Colors.grey,
              backgroundImage:
                  photoUrl != null ? NetworkImage(photoUrl!) : null,
              child: photoUrl == null
                  ? Center(
                      child: Text(
                      name[0].toUpperCase(),
                      style: context.textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ))
                  : null,
              radius: 35,
            ),
            SizedBox(width: context.width * 0.1),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "${events.eventType.constructedName} ",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              TextSpan(
                                text:
                                    events.daysLeft == 0 || events.daysLeft == 1
                                        ? ""
                                        : "in ",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              TextSpan(
                                text: events.daysLeft == 0
                                    ? "Today"
                                    : events.daysLeft == 1
                                        ? "Tomorrow"
                                        : events.daysLeft.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                              TextSpan(
                                text:
                                    events.daysLeft == 0 || events.daysLeft == 1
                                        ? ""
                                        : " days!",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${events.month} ${events.date}",
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            GestureDetector(
                onTap: onTap, child: const Icon(Icons.chevron_right)),
          ],
        ),
      ),
    );
  }
}

class FollowingTile extends StatelessWidget {
  const FollowingTile({
    Key? key,
    required this.name,
    required this.username,
    this.onActionClicked,
    this.onTap,
    this.photoUrl,
    this.actionWidget,
  }) : super(key: key);
  final String name;
  final String username;

  final String? photoUrl;
  final VoidCallback? onTap;
  final Function()? onActionClicked;
  final Widget? actionWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  photoUrl != null ? Colors.transparent : Colors.grey,
              backgroundImage:
                  photoUrl != null ? NetworkImage(photoUrl!) : null,
              child: photoUrl == null
                  ? Center(
                      child: Text(
                      name[0].toUpperCase(),
                      style: context.textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ))
                  : null,
              radius: 35,
            ),
            // CircleAvatar(
            //   backgroundImage:
            //       photoUrl != null ? NetworkImage(photoUrl!) : null,
            //   radius: 35,
            // ),
            SizedBox(width: context.width * 0.1),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  Text(
                    username,
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
            ),
            if (actionWidget != null)
              GestureDetector(onTap: onActionClicked, child: actionWidget),
          ],
        ),
      ),
    );
  }
}
