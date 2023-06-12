import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/follower_tile.dart';
import 'package:wegift/common/widgets/search_field.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/friends/invite.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/search/controller/search_controller.dart' as sc;
import 'package:wegift/src/settings/invite/invite.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sc.SearchController(context.read<Bootstrap>()),
      child: Builder(builder: (context) {
        final controller = context.read<sc.SearchController>();
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: SearchField(
                  onChanged: (v) {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      controller.search(v);
                    });
                  },
                  controller: searchController,
                  isTextCentered: false,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    context.to(const Invite());
                  },
                  child: Container(
                    width: context.width,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        "Invite Friends",
                        style: GoogleFonts.poppins(color: Colors.blue.shade600),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(builder: (context) {
                  final users = context.select(
                      (sc.SearchController value) => value.searchedUsers);
                  return ListView.builder(
                    itemCount: users.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Builder(builder: (context) {
                        final isFollowing = context.select(
                            (HomeController value) => value.followedUsers
                                .any((element) => element.uid == user.uid));
                        return FollowerTile(
                          onTap: () {
                            context.toNamed(AppRouter.friendProfile,
                                arguments: user);
                          },
                          name: "${user.firstName} ${user.lastName}",
                          userName: "${user.username}",
                          photoUrl: user.userDetails?.photoUrl,
                          isFollowing: isFollowing,
                          onFollowTap: () {
                            // log(isFollowing.toString());
                            context.read<sc.SearchController>().followUser(user,
                                currentUser:
                                    context.read<AuthController>().wegiftUser,
                                isUnfollowing: isFollowing);
                            if (!isFollowing) {
                              context
                                  .read<HomeController>()
                                  .updateNotificationSettingsOnFollow(
                                      uid: user.uid);
                            } else {
                              context
                                  .read<HomeController>()
                                  .removeSettingOnUnfollow(uid: user.uid);
                            }
                            // context.read<Noti>()
                          },
                        );
                      });
                    },
                  );
                }),
              )
            ],
          ),
        );
      }),
    );
  }
}

// hintText == '574-123-4567'
//                   ? MaskTextInputFormatter(
//                       mask: '###-###-####',
//                       filter: {"#": RegExp(r'[0-9]')},
//                       type: MaskAutoCompletionType.lazy)
//                   : hintText == "mm/dd/yyyy"
//                       ? MaskTextInputFormatter(
//                           mask: '##/##/####',
//                           filter: {"#": RegExp(r'[0-9]')},
//                           type: MaskAutoCompletionType.lazy)
//                       : MaskTextInputFormatter(
//                           mask: null,
//                           filter: null,
//                         ),
