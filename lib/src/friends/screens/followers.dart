import 'package:flutter/material.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/common/widgets/search_field.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/string_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/widgets/user_tiles.dart';

class Followers extends StatefulWidget {
  const Followers({
    Key? key,
    required this.args,
  }) : super(key: key);
  final FollowersArgs args;

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  final TextEditingController searchController = TextEditingController();

  late List<WeGiftUser> searchedUsers = [...widget.args.users];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Followers",
        backBtn: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: SearchField(
              controller: searchController,
              isTextCentered: true,
              onChanged: (v) {
                search(v);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchedUsers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final user = searchedUsers[index];
                return FollowingTile(
                  onTap: () {
                    context.toNamed(AppRouter.friendProfile, arguments: user);
                  },
                  actionWidget: IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      context.toNamed(AppRouter.friendProfile, arguments: user);
                    },
                  ),
                  photoUrl: user.userDetails?.photoUrl,
                  name: "${user.firstName} ${user.lastName}",
                  username: user.username ?? "",
                );
              },
            ),
          ),
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

class FollowersArgs {
  final List<WeGiftUser> users;

  FollowersArgs(this.users);
}
