import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final Icon icon;
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          subTitle,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
