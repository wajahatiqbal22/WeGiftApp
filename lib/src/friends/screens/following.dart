import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/buttons/common_post_login_button.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/common/widgets/search_field.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/string_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/home/widgets/user_tiles.dart';

class Following extends StatefulWidget {
  const Following({Key? key, required this.args}) : super(key: key);
  final FollowingArgs args;

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  final TextEditingController searchController = TextEditingController();

  late List<WeGiftUser> searchedUsers = [...widget.args.users];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Following",
        backBtn: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: SearchField(
              controller: searchController,
              isTextCentered: false,
              onChanged: (v) {
                search(v);
              },
            ),
          ),
          StatefulBuilder(builder: (context, setState) {
            return Expanded(
              child: ListView.builder(
                itemCount: searchedUsers.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final user = searchedUsers[index];
                  final isFollowing = context
                      .read<HomeController>()
                      .followedUsers
                      .any((element) => element.uid == user.uid);
                  return FollowingTile(
                    onTap: () {
                      context.toNamed(AppRouter.friendProfile, arguments: user);
                    },
                    actionWidget: widget.args.isOwnUser
                        ? CommonPostLoginButton(
                            height: 40,
                            btnText: isFollowing ? "Unfollow" : "Follow",
                            isFilled: true,
                            btnColor: isFollowing ? Colors.grey : Colors.blue,
                            onTap: () async {
                              await context
                                  .read<AuthController>()
                                  .followUser(user, isUnfollowing: isFollowing);
                              setState(() {});
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
                            },
                          )
                        : IconButton(
                            icon: const Icon(Icons.chevron_right),
                            onPressed: () {
                              context.toNamed(AppRouter.friendProfile,
                                  arguments: user);
                            },
                          ),
                    photoUrl: user.userDetails?.photoUrl,
                    name: "${user.firstName} ${user.lastName}",
                    username: user.username ?? "",
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  void search(String term) {
    term = term.toLowerCase();
    if (term.isEmpty) {
      setState(() {
        searchedUsers = [...widget.args.users];
      });
      return;
    }
    setState(() {
      searchedUsers = widget.args.users.where((element) {
        final firstName = element.firstName.toLowerCase().incrementalSplit();
        final lastName = element.lastName.toLowerCase().incrementalSplit();
        final phone =
            (element.phoneNumber?.toLowerCase() ?? "").incrementalSplit();
        final username =
            (element.username?.toLowerCase() ?? "").incrementalSplit();

        if ([firstName, lastName, phone, username]
            .any((element) => element.contains(term))) {
          return true;
        }
        return false;
      }).toList();
    });
  }
}

class FollowingArgs {
  final List<WeGiftUser> users;
  final bool isOwnUser;

  FollowingArgs(this.users, {required this.isOwnUser});
}
