import 'package:flutter/material.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/widgets/signup/follow_invite/search_contact_field.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';
import 'package:wegift/src/auth/widgets/signup/progress_buttons.dart';

class InviteContactView extends StatelessWidget {
  const InviteContactView(
      {super.key, required this.onNext, required this.state});

  final VoidCallback onNext;
  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchContactField(),
        const SizedBox(height: 20),
        const FormHeader(text: "Find friends and family"),
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
