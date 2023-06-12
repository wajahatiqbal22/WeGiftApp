import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wegift/common/widgets/common_tiles.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/utils/invite_by_email_dialogue.dart';

class Invite extends StatelessWidget {
  const Invite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Invite", backBtn: true),
      body: Column(
        children: [
          CommonTiles(
            text: "Invite friends by SMS",
            onTileTap: () async {
              final messageBody =
                  '${context.read<AuthController>().wegiftUser.firstName} is on WeGift. Join WeGift now and never miss your friends events. Click on the link to download the app now! \nwww.wegiftapps.com';
              final Uri smsLaunchAndroid = Uri(
                scheme: 'sms',
                queryParameters: <String, String>{'body': messageBody},
              );
              final Uri smsLaunchIOS = Uri.parse('sms:' '&body=$messageBody');
              await launchUrl(Platform.isIOS ? smsLaunchIOS : smsLaunchAndroid,
                      mode: LaunchMode.externalApplication)
                  .then(
                (value) => context.pop(),
              );
              // context.to(const InviteFriends(inviteBy: InviteBy.sms));
            },
            leadingIcon: const Icon(
              CupertinoIcons.chat_bubble_text,
            ),
          ),
          CommonTiles(
            text: "Invite friends by email",
            onTileTap: () async {
              final isPoped = await showInviteByEmailDialouge(context);
              if (isPoped ?? false) {}
            },
            leadingIcon: const Icon(Icons.email_outlined),
          ),
          // CommonTiles(
          //     text: "Invite friends by...",
          //     onTileTap: () {},
          //     leadingIcon: const Icon(Icons.cloud_upload_outlined)),
          // CommonTiles(
          //     text: "Follow Contacts",
          //     onTileTap: () {},
          //     leadingIcon: const Icon(Icons.person_outline)),
        ],
      ),
    );
  }
}
