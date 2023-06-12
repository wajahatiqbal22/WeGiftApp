import 'package:flutter/material.dart';
import 'package:wegift/extensions/build_context_extension.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.textTheme.headline5?.copyWith(
        fontWeight: FontWeight.w500,
        // color: Colors.black,
      ),
    );
  }
}
