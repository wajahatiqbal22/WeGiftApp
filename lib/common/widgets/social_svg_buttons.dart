import 'package:flutter/material.dart';

class SocialSvgButton extends StatelessWidget {
  final String text;
  final dynamic svg;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final dynamic onPressed;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final Color shadowColor;
  final BoxDecoration decoration;
  final bool isLoading;

  const SocialSvgButton({
    super.key,
    required this.text,
    required this.svg,
    required this.onPressed,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.height = 50,
    this.width = double.infinity,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginTop = 0.0,
    this.isLoading = false,
    this.shadowColor = Colors.transparent,
    this.decoration = const BoxDecoration(boxShadow: [
      BoxShadow(
        color: Color(0x0D000000),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 4),
      ),
    ]),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      height: height,
      width: width,
      padding: EdgeInsets.only(
          left: paddingLeft, right: paddingRight, top: paddingTop, bottom: paddingBottom),
      margin: EdgeInsets.only(
          left: marginLeft, right: marginRight, top: marginTop, bottom: marginBottom),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            svg,
            isLoading
                ? const CircularProgressIndicator.adaptive()
                : Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
            Opacity(
              opacity: 0,
              child: svg,
            ),
          ],
        ),
      ),
    );
  }
}
