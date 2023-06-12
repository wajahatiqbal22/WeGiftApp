import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TilesWithToggler extends StatelessWidget {
  const TilesWithToggler({
    Key? key,
    required this.name,
    required this.userName,
    required this.onChanged,
    this.initialValue = false,
    this.icon,
    this.toggleSection,
    this.isLeadingRequired,
    this.profileUrl,
    this.noVerticalPadding,
  }) : super(key: key);
  final String name;
  final String? userName;
  final Icon? icon;
  final bool? isLeadingRequired;
  final String? toggleSection;
  final String? profileUrl;
  final Function(bool) onChanged;
  final bool initialValue;
  final bool? noVerticalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: noVerticalPadding != null ? 0 : 12),
      child: ListTile(
        minVerticalPadding: 0,
        visualDensity:
            VisualDensity(vertical: noVerticalPadding != null ? 0 : 3),
        leading: isLeadingRequired == false
            ? null
            : icon ??
                (profileUrl == null
                    ? const CircleAvatar(
                        radius: 35,
                        child: Icon(Icons.account_circle_outlined,
                            color: Colors.white, size: 50))
                    : CircleAvatar(
                        backgroundImage: NetworkImage(profileUrl!),
                        radius: 35,
                      )),
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            name,
            style: GoogleFonts.poppins(),
          ),
        ),
        subtitle: userName != null
            ? Text(
                userName!,
                style: GoogleFonts.poppins(),
              )
            : null,
        trailing: CupertinoSwitch(
          activeColor: Colors.blue.shade700,
          value: initialValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
