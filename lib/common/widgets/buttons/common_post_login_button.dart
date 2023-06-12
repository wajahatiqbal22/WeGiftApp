import 'package:flutter/material.dart';

class CommonPostLoginButton extends StatelessWidget {
  const CommonPostLoginButton({
    Key? key,
    required this.btnText,
    this.borderRadius,
    this.isFilled,
    this.btnColor,
    required this.onTap,
    this.height,
    this.width = 120,
    this.alignment = Alignment.center,
  }) : super(key: key);
  final String btnText;
  final double? borderRadius;
  final bool? isFilled;
  final Function()? onTap;
  final Color? btnColor;
  final AlignmentGeometry alignment;
  final double? height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 3),
        width: width,
        alignment: alignment,
        decoration: BoxDecoration(
          color: isFilled == true ? btnColor ?? Colors.grey : btnColor ?? Colors.white,
          border: Border.all(color: isFilled == true ? Colors.transparent : Colors.black),
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
        child: Text(
          btnText,
          style: TextStyle(
            // color: Colors.black,
            fontWeight: FontWeight.w500,
            color: isFilled == true ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
