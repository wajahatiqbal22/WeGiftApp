import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.suffixIcon,
      required this.backBtn,
      this.onSuffixTap,
      this.elevation})
      : super(key: key);
  final String title;
  final Icon? suffixIcon;
  final bool backBtn;
  final double? elevation;
  final Function()? onSuffixTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation ?? 1,
      leading: backBtn
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.chevron_left,
                size: 40,
              ),
            )
          : const SizedBox(),
      title: Text(
        title,
        style: GoogleFonts.poppins(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
              onTap: onSuffixTap, child: suffixIcon ?? const SizedBox()),
        )
      ],
      centerTitle: true,
    );
  }
}
