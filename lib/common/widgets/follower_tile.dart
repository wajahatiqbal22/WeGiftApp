import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegift/common/widgets/buttons/common_post_login_button.dart';
import 'package:wegift/extensions/build_context_extension.dart';

class FollowerTile extends StatelessWidget {
  const FollowerTile({
    Key? key,
    required this.name,
    required this.userName,
    required this.isFollowing,
    required this.onFollowTap,
    this.onTap,
    this.photoUrl,
  }) : super(key: key);
  final String name, userName;
  final bool isFollowing;
  final Function()? onTap;
  final Function()? onFollowTap;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        onTap: onTap,
        minVerticalPadding: 0,
        visualDensity: const VisualDensity(vertical: 3),
        leading: CircleAvatar(
          backgroundColor: photoUrl != null ? Colors.transparent : Colors.grey,
          radius: 35,
          backgroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
          child: photoUrl == null
              ? Center(
                  child: Text(
                  name[0].toUpperCase(),
                  style: context.textTheme.headline4?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ))
              : null,
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            name,
            style: GoogleFonts.poppins(),
          ),
        ),
        subtitle: Text(
          userName,
          style: GoogleFonts.poppins(),
        ),
        trailing: CommonPostLoginButton(
          height: 40,
          btnText: isFollowing ? "Unfollow" : "Follow",
          isFilled: true,
          btnColor: isFollowing ? Colors.grey : Colors.blue,
          onTap: onFollowTap,
        ),
      ),
    );
  }
}
