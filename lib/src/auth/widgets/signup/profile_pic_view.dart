import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';
import 'package:wegift/src/auth/widgets/signup/progress_buttons.dart';

class ProfilePicView extends StatefulWidget {
  const ProfilePicView({super.key, required this.onNext, required this.state});

  final VoidCallback onNext;
  final RegisterState state;

  @override
  State<ProfilePicView> createState() => _ProfilePicViewState();
}

class _ProfilePicViewState extends State<ProfilePicView> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        file != null
            ? CircleAvatar(
                radius: 55,
                backgroundImage: FileImage(file!),
              )
            : const Icon(Icons.person_outline_rounded, size: 100),
        const SizedBox(height: 10),
        const FormHeader(text: "Add a profile picture so friends can find you"),
        const SizedBox(height: 40),
        Flexible(
          flex: 0,
          child: ProgressButtons(
            isEnabled: true,
            onNext: file == null
                ? () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() {
                      file = image != null ? File(image.path) : null;
                    });
                  }
                : () {
                    final controller = context.read<AuthController>();
                    controller.model.photoFile = file;
                    widget.onNext();
                    FocusScope.of(context).unfocus();
                  },
            onSkip: () {
              widget.onNext();
            },
            primaryButtonText:
                file == null ? widget.state.primaryButtonText : "Next",
            secondaryButtonText:
                file == null ? widget.state.secondaryButtonText : null,
          ),
        ),
      ],
    );
  }
}
