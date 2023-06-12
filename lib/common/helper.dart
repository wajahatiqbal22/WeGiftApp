import 'package:flutter/material.dart';
import 'package:wegift/extensions/build_context_extension.dart';

class Helper {
  static InputDecoration getInputDecoration({
    bool? isLabelCentered,
    String? label,
    String? hintText,
    Icon? suffixIcon,
    Icon? prefixIcon,
  }) {
    return InputDecoration(
      label: label != null
          ? Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: isLabelCentered != null && isLabelCentered == true
                  ? Center(
                      child: Text(label),
                    )
                  : Text(label),
            )
          : const SizedBox(),
      hintText: hintText,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      suffixIcon: suffixIcon,
      prefix: prefixIcon,
    );
  }

  static ButtonStyle getButtonStyle(BuildContext context) {
    return ButtonStyle(
      minimumSize: context.value<Size>(const Size(double.infinity, 50)),
      shape: context.value<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    );
  }

  static String getFormattedDate(DateTime date) {
    return "${date.month}\t/\t${date.day}\t/\t${date.year}";
  }
}
