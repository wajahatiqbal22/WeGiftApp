import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInput extends StatelessWidget {
  final String placeholder;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final bool obscureText;
  final double width;
  final int limit;
  final Widget? prefixIcon;
  final double prefixIconWidth;
  final double contentPadding;
  final double placeholderSize;
  final void Function(String value)? onChanged;
  final bool? backAutoFocus;
  final bool? frontAutoFocus;

  const OtpInput({
    super.key,
    required this.placeholder,
    this.paddingLeft = 0.0,
    this.paddingTop = 0.0,
    this.paddingRight = 0.0,
    this.paddingBottom = 0.0,
    this.obscureText = false,
    this.width = double.infinity,
    this.limit = 255,
    this.prefixIcon,
    this.prefixIconWidth = 35,
    this.contentPadding = 20,
    this.placeholderSize = 12,
    this.onChanged,
    this.backAutoFocus = false,
    this.frontAutoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: paddingLeft, top: paddingTop, right: paddingRight, bottom: paddingBottom),
      width: width,
      child: TextFormField(
        validator: (v) {
          if (v?.isEmpty ?? false) {
            return "";
          }

          return null;
        },
        autofocus: true,
        style: const TextStyle(fontSize: 14),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          if (value.isEmpty) {
            if (backAutoFocus!) {
              FocusScope.of(context).previousFocus();
            }
          } else {
            if (frontAutoFocus!) FocusScope.of(context).nextFocus();
          }

          onChanged?.call(value);
        },
        maxLength: limit,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: prefixIcon,
                )
              : null,
          prefixIconConstraints: BoxConstraints(maxWidth: prefixIconWidth),
          hintText: placeholder,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: placeholderSize,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD3DCE4), width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1.5),
          ),
          filled: true,
          fillColor: const Color(0xFFF4FAFF),
          contentPadding: EdgeInsets.all(contentPadding),
          border: const OutlineInputBorder(),
          counterText: '',
        ),
        obscureText: obscureText,
      ),
    );
  }
}
