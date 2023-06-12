import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';
import 'package:wegift/src/auth/widgets/signup/progress_buttons.dart';

class NotificationPermView extends StatefulWidget {
  const NotificationPermView({super.key, required this.onNext, required this.state});

  final VoidCallback onNext;
  final RegisterState state;

  @override
  State<NotificationPermView> createState() => _NotificationPermViewState();
}

class _NotificationPermViewState extends State<NotificationPermView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller = context.read<AuthController>();
      controller.requestNotificationsPermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.cake,
          size: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        const FormHeader(text: "Don't miss a friends birthday!"),
        const SizedBox(height: 20),
        Text(
          "Enable notifications so you can be in the know when your friends birthday is coming up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 40),
        Flexible(
          flex: 1,
          child: Center(
            child: ProgressButtons(
              onNext: () async {
                final controller = context.read<AuthController>();
                widget.onNext();
                FocusScope.of(context).unfocus();
              },
              primaryButtonText: widget.state.primaryButtonText,
              secondaryButtonText: widget.state.secondaryButtonText,
            ),
          ),
        ),
      ],
    );
  }
}
