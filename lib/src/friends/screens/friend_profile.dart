import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wegift/common/filter_events/filter_events.dart';
import 'package:wegift/common/widgets/buttons/common_post_login_button.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/date_time_extension.dart';
import 'package:wegift/extensions/notifications_extension.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/web_view.dart/screens/web_view_screen.dart';
import 'package:wegift/src/bottom_nav_bar/screen/app_bottom_nav.dart';
import 'package:wegift/src/friends/controllers/friends_controller.dart';
import 'package:wegift/src/friends/screens/followers.dart';
import 'package:wegift/src/friends/screens/following.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/profile/screens/add_wishlist_details.dart';
import 'package:wegift/src/profile/screens/profile.dart';
import 'package:wegift/src/profile/widgets/personal_details.dart';
import 'package:wegift/src/profile/widgets/wish_item.dart';
import 'package:wegift/src/settings/events/events.dart';

class FriendProfile extends StatefulWidget {
  const FriendProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final WeGiftUser user;

  @override
  State<FriendProfile> createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  late WeGiftUser user;

  @override
  void initState() {
    // TODO: implement initState
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final controller = context.watch<HomeController>();
      return ChangeNotifierProvider(
        create: (context) =>
            FriendsController(context.read<Bootstrap>(), friend: user),
        child: Scaffold(
          appBar: CustomAppBar(
            title: user.username ?? "",
            backBtn: true,
          ),
          bottomNavigationBar: const AppBottomNav(),
          body: Builder(builder: (context) {
            final friendsController = context.read<FriendsController>();
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(builder: (context) {
                            final followings = context.select(
                                (FriendsController controller) =>
                                    controller.followingUsers);
                            return GestureDetector(
                              onTap: () {
                                context.toNamed(AppRouter.followers,
                                    arguments: FollowersArgs(followings));
                              },
                              child: Column(
                                children: [
                                  Text(
                                    followings.length.toString(),
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "Followers",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            );
                          }),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    user.userDetails?.photoUrl != null
                                        ? Colors.transparent
                                        : Colors.grey,
                                backgroundImage: user.userDetails?.photoUrl !=
                                        null
                                    ? NetworkImage(user.userDetails!.photoUrl!)
                                    : null,
                                child: user.userDetails?.photoUrl == null
                                    ? Center(
                                        child: Text(
                                        user.userDetails!.firstName![0]
                                            .toUpperCase(),
                                        style: context.textTheme.headline4
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                      ))
                                    : null,
                                radius: 65,
                              ),
                            ],
                          ),
                          Builder(builder: (context) {
                            final followed = context.select(
                                (FriendsController controller) =>
                                    controller.followedUsers);
                            return GestureDetector(
                              onTap: () {
                                context.toNamed(AppRouter.following,
                                    arguments: FollowingArgs(followed,
                                        isOwnUser: false));
                              },
                              child: Column(
                                children: [
                                  Text(
                                    followed.length.toString(),
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "Following",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "${widget.user.firstName} ${widget.user.lastName}",
                      style: context.textTheme.headline6?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: context.height * 0.04,
                          left: context.width * 0.18,
                          right: context.width * 0.18),
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonPostLoginButton(
                              alignment: Alignment.center,
                              btnText: controller.followedUsers
                                      .any((element) => element.uid == user.uid)
                                  ? "Unfollow"
                                  : "Follow",
                              borderRadius: 10,
                              onTap: () {
                                final isFollowing = controller.followedUsers
                                    .any((element) => element.uid == user.uid);
                                final currentUser =
                                    context.read<AuthController>().wegiftUser;
                                print(currentUser);
                                context.read<FriendsController>().followUser(
                                    widget.user,
                                    currentUser: context
                                        .read<AuthController>()
                                        .wegiftUser,
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
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CommonPostLoginButton(
                              alignment: Alignment.center,
                              btnText: "Events",
                              borderRadius: 10,
                              onTap: () {
                                context.toNamed(AppRouter.events,
                                    arguments: EventsArgs(widget.user));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    controller.followedUsers
                            .any((element) => element.uid == user.uid)
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: context.height * 0.04,
                                left: context.width * 0.1,
                                right: context.width * 0.1),
                            child: Builder(builder: (context) {
                              final events = getFilteredEvents(
                                  user: user,
                                  notificaitonSettings: context
                                      .watch<HomeController>()
                                      .notificationSettings);
                              return events.isEmpty
                                  ? const SizedBox()
                                  : events.length < 2
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: PersonalDetails(
                                                  icon: events.first.eventType
                                                      .getEventIcon,
                                                  title:
                                                      "${events.first.eventType.constructedName} in ${events.first.daysLeft} days!",
                                                  subTitle:
                                                      DateFormat.MMMMd().format(
                                                    events.first.eventDate,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 5,
                                            childAspectRatio: 1,
                                            crossAxisSpacing: 70,
                                          ),
                                          itemCount: events.length,
                                          itemBuilder: (context, index) {
                                            return PersonalDetails(
                                                icon: events[index]
                                                    .eventType
                                                    .getEventIcon,
                                                title:
                                                    "${events[index].eventType.constructedName} in ${events[index].daysLeft} days!",
                                                subTitle:
                                                    DateFormat.MMMMd().format(
                                                  events[index].eventDate,
                                                ));
                                          });
                            }),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                              top: context.height * 0.05,
                              bottom: 20,
                              left: 24,
                              right: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: PersonalDetails(
                                    icon: const Icon(
                                      CupertinoIcons.gift,
                                      color: Colors.blue,
                                      size: 35,
                                    ),
                                    title:
                                        "Birthday in ${widget.user.userDetails!.birthday!.getDaysTillDate} days!",
                                    subTitle: DateFormat.MMMMd().format(
                                      user.userDetails!.birthday!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    Text(
                      "Wish List",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Builder(builder: (context) {
                        final data =
                            _assembleWishlist(user.wishlist.values.toList());

                        return Column(
                            children: List.generate(data.length, (i) {
                          final items = data[i];
                          return Row(
                              children: items.map((e) {
                            log(user.wishlist.toString());
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: WishItem(
                                  wishlist: e,
                                  isBtnFilled: e.isReserved,
                                  btnText:
                                      e.isReserved ? "Reserved" : "Reserve",
                                  optionIcon: e.isReserved &&
                                          e.reservedBy ==
                                              context
                                                  .read<AuthController>()
                                                  .wegiftUser
                                                  .uid
                                      ? true
                                      : false,
                                  optionalActions: e.isReserved &&
                                          e.reservedBy ==
                                              context
                                                  .read<AuthController>()
                                                  .wegiftUser
                                                  .uid
                                      ? [
                                          PopupMenuItem(
                                            child: const Text("Unreserve"),
                                            onTap: () {
                                              final newWishlist = {
                                                ...user.wishlist,
                                                e.id: e.copyWith(
                                                    reservedBy: null,
                                                    isReserved: false),
                                              };
                                              setState(() {
                                                user = user.copyWith(
                                                    wishlist: newWishlist);
                                              });
                                              friendsController
                                                  .reserveWishlistItem(
                                                      item: e,
                                                      owner: user,
                                                      unreserving: true);
                                            },
                                          )
                                        ]
                                      : [],
                                  onReserveClicked: () {
                                    friendsController.reserveWishlistItem(
                                      item: e,
                                      owner: user,
                                      onSuccess: (item) {
                                        final newWishlist = {
                                          ...user.wishlist,
                                          item.id: item
                                        };

                                        setState(() {
                                          user = user.copyWith(
                                              wishlist: newWishlist);
                                        });
                                      },
                                      onError: () {},
                                    );
                                  },
                                  onOpen: () {
                                    context.to(Scaffold(
                                      bottomNavigationBar: const AppBottomNav(),
                                      body: WishlistWebview(
                                        initialUrl: e.link,
                                        onNavigationChanged:
                                            (scrapedData) async {
                                          final controller =
                                              context.read<AuthController>();
                                          final wishist = Wishlist(
                                            link: scrapedData.url,
                                            id: scrapedData.id,
                                            productImage:
                                                scrapedData.image != null
                                                    ? [scrapedData.image!]
                                                    : [],
                                            price: scrapedData.price,
                                            title: scrapedData.title,
                                          );
                                          // final assembledWishlist =
                                          //     controller.assembleWishlistItem(url);
                                          // context.pop();
                                          context.to(AddWishlistDetails(
                                              item: wishist));
                                          // await controller.addToWishlist(wishist);
                                        },
                                        javascriptMode:
                                            JavascriptMode.unrestricted,
                                      ),
                                    ));
                                  },
                                ),
                              ),
                            );
                          }).toList()
                              //  [
                              //   Expanded(
                              //     child: WishItem(
                              //       itemName: "Apple Watch Series 6",
                              //       // price: "\$274.95",
                              //       btnText: "Reserve",

                              //       optionIcon: true,
                              //       onTap: () {},
                              //     ),
                              //   ),
                              //   const SizedBox(width: 10),
                              //   Expanded(
                              //     child: WishItem(
                              //       item:
                              //       // itemName: "Whisky Flavor Kit",
                              //       // price: "\$69.90",
                              //       btnText: "Reserved",
                              //       isBtnFilled: true,
                              //       optionIcon: true,
                              //       onTap: () {},
                              //     ),
                              //   ),
                              // ],
                              );
                        }).toList());
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }

  List<List<Wishlist>> _assembleWishlist(List<Wishlist> wishlist) {
    const int limit = 2;
    int startIndex = 0;
    final List<List<Wishlist>> list = [];
    final List<Wishlist> d = [];

    for (int i = startIndex; i < wishlist.length; i++) {
      d.add(wishlist[i]);
      if (i == (limit - 1 + startIndex)) {
        list.add([...d]);
        startIndex = i + 1;
        d.clear();
      }
    }
    list.add(d);
    return list;
  }
}
