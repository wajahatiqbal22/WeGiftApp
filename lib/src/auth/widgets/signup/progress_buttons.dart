import 'package:flutter/material.dart';
import 'package:wegift/common/colors.dart';
import 'package:wegift/common/helper.dart';
import 'package:wegift/extensions/build_context_extension.dart';

class ProgressButtons extends StatelessWidget {
  const ProgressButtons({
    required this.primaryButtonText,
    required this.onNext,
    this.secondaryButtonText,
    this.isEnabled = true,
    this.onSkip,
    Key? key,
  }) : super(key: key);
  final String primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback onNext;
  final bool isEnabled;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: Helper.getButtonStyle(context).copyWith(
              backgroundColor: context.value<Color>(isEnabled ? kPrimaryColor : Colors.grey)),
          onPressed: isEnabled ? onNext : null,
          child: Text(
            primaryButtonText,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        if (secondaryButtonText != null)
          Column(
            children: [
              const SizedBox(height: 10),
              ElevatedButton(
                style: Helper.getButtonStyle(context).copyWith(
                  //TODO: Uncomment below code
                  // side: const MaterialStatePropertyAll(
                  //   BorderSide(
                  //     color: kPrimaryColor,
                  //   ),
                  // ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                ),
                onPressed: onSkip ?? onNext,
                child: Text(
                  secondaryButtonText!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
