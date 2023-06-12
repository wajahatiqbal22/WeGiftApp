import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';
import 'package:wegift/src/auth/widgets/signup/progress_buttons.dart';

class ContactPermView extends StatelessWidget {
  const ContactPermView({super.key, required this.onNext, required this.state});

  final VoidCallback onNext;
  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.people_outline_rounded, size: 100),
        const SizedBox(height: 10),
        const FormHeader(
          text: "WeGift is better with your friends and family",
        ),
        const SizedBox(height: 20),
        Text(
          "See who's on WeGift by syncing your contacts",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 20),
        Builder(builder: (context) {
          final contactState =
              context.select<AuthController, ContactState>((value) => value.contactState);
          if (contactState == ContactState.denied) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Permission Denied for contacts. Please enable contacts permissions from your settings",
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6!.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
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
          }
          return const SizedBox();
        }),
        const SizedBox(height: 40),
        Flexible(
          flex: 0,
          child: ProgressButtons(
            onNext: onNext,
            primaryButtonText: state.primaryButtonText,
            secondaryButtonText: state.secondaryButtonText,
          ),
        ),
      ],
    );
  }
}
