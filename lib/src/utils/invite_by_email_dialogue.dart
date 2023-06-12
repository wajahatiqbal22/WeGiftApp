import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wegift/common/colors.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/string_extension.dart';

Future<bool?> showInviteByEmailDialouge(BuildContext context) async {
  final emailCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  return await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Center(child: Text('Invite by email')),
      icon: const Icon(
        Icons.share,
        size: 35,
        color: kPrimaryColor,
      ),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: emailCon,
              validator: (value) {
                if (!value!.emailValid) {
                  return "Please enter a valid email";
                }
                return null;
              },
              decoration: const InputDecoration(label: Text("Email")),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Cancel')),
        ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  final Uri params = Uri(
                    scheme: 'mailto',
                    path: emailCon.text,
                    query:
                        'subject=Invitation&body=Join WeGift now and never miss your friends events. Click on the link to download the app now! \nwww.wegiftapps.com', //add subject and body here
                  );

                  await launchUrl(params);
                  // await launchUrlString(
                  //     "mailto:${emailCon.text}?subject=Invitation&body=Join WeGift now and never miss your friends events. Click on the link to download the app now!");
                } catch (e) {
                  log(e.toString());
                }
              }
            },
            child: const Text('Invite'))
      ],
    ),
  );
}
