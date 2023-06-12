import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';

class ContactStateHandler extends StatelessWidget {
  const ContactStateHandler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authCon = context.read<AuthController>();
    return Expanded(
      child: Builder(builder: (context) {
        final contactState =
            context.select<AuthController, ContactState>((value) => value.contactState);
        switch (contactState) {
          case ContactState.getting:
          case ContactState.none:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ContactState.denied:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Permission Denied for contacts. Please enable contacts permissions from your settings",
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6!.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () async {
                      await AppSettings.openAppSettings();
                    },
                    child: const Text("Allow in settings"),
                  ),
                ],
              ),
            );

          case ContactState.success:
            return const SizedBox();
          case ContactState.noContacts:
            return Center(
              child: Text(
                "No Contact Found",
                textAlign: TextAlign.center,
                style: context.textTheme.headline6,
              ),
            );
          case ContactState.exception:
            return Container(
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "There was an error getting contacts!",
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () async {
                      await authCon.initContact();
                    },
                    child: const Text("Try again"),
                  ),
                ],
              ),
            );
        }
      }),
    );
  }
}
