import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTiles extends StatelessWidget {
  const CommonTiles({
    Key? key,
    required this.text,
    required this.onTileTap,
    required this.leadingIcon,
  }) : super(key: key);
  final String text;
  final Function()? onTileTap;
  final Icon? leadingIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTileTap,
      leading: leadingIcon,
      title: Text(
        text,
        style: GoogleFonts.poppins(color: Colors.black),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: Colors.black),
    );
  }
}
