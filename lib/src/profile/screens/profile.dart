import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:wegift/common/colors.dart';
import 'package:wegift/common/utility.dart';
import 'package:wegift/common/widgets/buttons/common_post_login_button.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/date_time_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/web_view.dart/screens/web_view_screen.dart';
import 'package:wegift/src/bottom_nav_bar/screen/app_bottom_nav.dart';
import 'package:wegift/src/friends/screens/followers.dart';
import 'package:wegift/src/friends/screens/following.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/profile/screens/add_wishlist_details.dart';
import 'package:wegift/src/profile/widgets/personal_details.dart';
import 'package:wegift/src/profile/widgets/wish_item.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        final controller = context.watch<AuthController>();
        return Column(
          children: [
            CustomAppBar(
              title: controller.wegiftUser.username ?? "",
              backBtn: false,
              elevation: 0,
              suffixIcon: const Icon(Icons.settings_outlined),
              onSuffixTap: () {
                context.toNamed(AppRouter.settings);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Builder(builder: (context) {
                            final followings = context.select(
                                (HomeController controller) =>
                                    controller.followingUsers);
                            return GestureDetector(
                              onTap: () {
                                context.toNamed(AppRouter.followers,
                                    arguments: FollowersArgs(followings));
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
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
                          CircleAvatar(
                            backgroundColor:
                                controller.wegiftUser.userDetails?.photoUrl !=
                                        null
                                    ? Colors.transparent
                                    : Colors.grey,
                            backgroundImage:
                                controller.wegiftUser.userDetails?.photoUrl !=
                                        null
                                    ? NetworkImage(controller
                                        .wegiftUser.userDetails!.photoUrl!)
                                    : null,
                            // backgroundImage:
                            //     controller.wegiftUser.userDetails?.photoUrl !=
                            //             null
                            //         ? NetworkImage(controller
                            //             .wegiftUser.userDetails!.photoUrl!)
                            //         : null,
                            radius: 65,
                            child:
                                controller.wegiftUser.userDetails?.photoUrl ==
                                        null
                                    ? Center(
                                        child: Text(
                                        controller.wegiftUser.userDetails!
                                            .firstName![0]
                                            .toUpperCase(),
                                        style: context.textTheme.headline4
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                      ))
                                    : null,
                          ),
                          Builder(builder: (context) {
                            final followed = context.select(
                                (HomeController controller) =>
                                    controller.followedUsers);
                            return GestureDetector(
                              onTap: () {
                                context.toNamed(AppRouter.following,
                                    arguments: FollowingArgs(followed,
                                        isOwnUser: true));
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
                      "${controller.wegiftUser.firstName} ${controller.wegiftUser.lastName}",
                      style: context.textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonPostLoginButton(
                          btnText: "Edit Profile",
                          borderRadius: 10,
                          onTap: () {
                            context.toNamed(AppRouter.profileSetting);
                          },
                        ),
                        const SizedBox(width: 10),
                        CommonPostLoginButton(
                          btnText: "Invite",
                          borderRadius: 10,
                          onTap: () {
                            context.toNamed(AppRouter.invite);
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Builder(builder: (context) {
                            final birthday =
                                controller.wegiftUser.userDetails!.birthday!;
                            return Expanded(
                              child: PersonalDetails(
                                  icon: const Icon(
                                    CupertinoIcons.gift,
                                    color: Colors.blue,
                                    size: 35,
                                  ),
                                  title:
                                      "Birthday in ${birthday.getDaysTillDate} days!",
                                  subTitle: DateFormat.MMMMd().format(
                                    controller
                                        .wegiftUser.userDetails!.birthday!,
                                  )),
                            );
                          }),
                          if (controller.wegiftUser.userDetails!.anniversary !=
                              null)
                            Expanded(
                              child: PersonalDetails(
                                icon: const Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.red,
                                  size: 35,
                                ),
                                title:
                                    "Anniversary in ${controller.wegiftUser.userDetails!.anniversary!.getDaysTillDate} days!",
                                subTitle: DateFormat.MMMMd().format(
                                  controller
                                      .wegiftUser.userDetails!.anniversary!,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Wish List",
                            style: GoogleFonts.poppins(fontSize: 20)),
                        // IconButton(
                        //   onPressed: () {
                        //     context.to(
                        //       Scaffold(
                        //         bottomNavigationBar: const AppBottomNav(),
                        //         body: WishlistWebview(
                        //           initialUrl: "https://www.amazon.com/",
                        //           onNavigationChanged: (scrapedData) async {
                        //             final wishist = Wishlist(
                        //                 link: scrapedData.url,
                        //                 id: scrapedData.id,
                        //                 productImage: scrapedData.image,
                        //                 price: scrapedData.price,
                        //                 title: scrapedData.title);
                        //             // final assembledWishlist =
                        //             //     controller.assembleWishlistItem(url);
                        //             // context.pop();
                        //             context
                        //                 .to(AddWishlistDetails(item: wishist));
                        //             await controller.addToWishlist(wishist);
                        //           },
                        //           javascriptMode: JavascriptMode.unrestricted,
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   icon: const Icon(Icons.add),
                        // ),
                      ],
                    ),
                    const Divider(thickness: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Builder(builder: (context) {
                        final data = _assembleWishlist(
                            controller.wegiftUser.wishlist.values.toList());

                        return Column(
                            children: List.generate(data.length, (i) {
                          final items = data[i];
                          return Row(
                              children: items
                                  .map(
                                    (e) => Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: WishItem(
                                          wishlist: e,
                                          btnText: "Reserve",
                                          optionIcon: true,
                                          isButtonEnabled: false,
                                          optionalActions: [
                                            PopupMenuItem(
                                              child: const Text("Remove"),
                                              onTap: () {
                                                final newWishlist = {
                                                  ...controller
                                                      .wegiftUser.wishlist,
                                                };
                                                newWishlist.removeWhere(
                                                    (k, v) => v.id == e.id);
                                                controller.wegiftUser =
                                                    controller.wegiftUser
                                                        .copyWith(
                                                            wishlist:
                                                                newWishlist);
                                                controller
                                                    .removeFromWishlist(e);
                                              },
                                            )
                                          ],
                                          onReserveClicked: () {},
                                          onOpen: () {
                                            context.to(
                                              Scaffold(
                                                bottomNavigationBar:
                                                    const AppBottomNav(),
                                                body: WishlistWebview(
                                                  initialUrl: e.link,
                                                  onNavigationChanged:
                                                      (scrapedData) async {
                                                    final controller = context
                                                        .read<AuthController>();
                                                    final wishist = Wishlist(
                                                        link: scrapedData.url,
                                                        id: scrapedData.id,
                                                        productImage:
                                                            scrapedData.image !=
                                                                    null
                                                                ? [
                                                                    scrapedData
                                                                        .image!
                                                                  ]
                                                                : [],
                                                        price:
                                                            scrapedData.price,
                                                        title:
                                                            scrapedData.title);
                                                    // final assembledWishlist =
                                                    //     controller.assembleWishlistItem(url);
                                                    // context.pop();
                                                    context.to(
                                                        AddWishlistDetails(
                                                            item: wishist));
                                                    // await controller.addToWishlist(wishist);
                                                  },
                                                  javascriptMode: JavascriptMode
                                                      .unrestricted,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList()
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
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
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

class WishlistWebview extends StatefulWidget {
  const WishlistWebview(
      {super.key,
      required this.onNavigationChanged,
      required this.initialUrl,
      required this.javascriptMode});
  final Function(ScarpData) onNavigationChanged;
  final String initialUrl;
  final JavascriptMode javascriptMode;

  @override
  State<WishlistWebview> createState() => _WishlistWebviewState();
}

class _WishlistWebviewState extends State<WishlistWebview> {
  late String url = widget.initialUrl;
  late InAppWebViewController controller;

  String getAmazonTitle(String html) {
    String result = "";

    List<String> regs = [
      r'(?<=<h1.*?id="title".*?>)(.*?)(?=<)',
      r'(?<=<span.*?id="title".*?>)(.*?)(?=<\/span>)'
    ];

    for (var reg in regs) {
      RegExp exp = RegExp(reg);
      RegExpMatch? match = exp.firstMatch(html);

      if (match != null && result.isEmpty) {
        var element = match[0];
        if (element != null && element.isNotEmpty) {
          result = element.trim();
        }
      }
    }

    return result;
  }

  String getAmazonPrice(String html) {
    String result = "";

    List<String> regs = [
      r'(?<=<span class="a-price a-text-price a-size-medium apexPriceToPay".*?>)([\$\£\€](\d+(?:\.\d{1,2})?))(?=<\/span>)',
      r'(?<=<span class="a-price aok-align-center reinventPricePriceToPayMargin priceToPay".*?>)([\$\£\€](\d+(?:\.\d{1,2})?))(?=<\/span>)',
      r'[\$\£\€](\d+(?:\.\d{1,2})?)'
    ];

    for (var reg in regs) {
      RegExp exp = RegExp(reg);
      RegExpMatch? match = exp.firstMatch(html);

      if (match != null && result.isEmpty) {
        var element = match[0];
        if (element != null && element.isNotEmpty) {
          result = element.trim();
          log(result);
        }
      }
    }

    return result;
  }

  String getAmazonImage(String html) {
    String result = "";

    RegExp exp = RegExp(r'https:\/\/m\.media-amazon\.com\/images\/I\/.*?\.jpg');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null) {
      var image1 = match[0];
      if (image1 != null && image1.isNotEmpty) {
        result = image1;
      }
    }

    return result;
  }

  String getWalmartTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:title".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getWalmartImage(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:image".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getWalmartPrice(String html) {
    String result = "";

    RegExp exp = RegExp(r'(?<=<span.*itemprop="price".*?>)(.*?)(?=<\/span>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getLowesTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:title".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getLowesImage(String html) {
    String result = "";

    RegExp exp = RegExp(r'(?<=<img.*?src=")(.*?)(?=\".*?id="imgZoom0)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getLowesPrice(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<span.*?class="item-price-dollar".*?>)(.*?)(?=<\/span>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getAppleTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:title".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getAppleImage(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:image".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getApplePrice(String html) {
    String result = "";

    RegExp exp = RegExp(
        r'(?<=<.*?class="rc-prices-fullprice".*?>)([\$\£\€](\d+(?:\.\d{1,2})?))(?=\<\/span>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getTargetTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<h1.*?data-test="product-title".*?>)(.*?)(?=\<\/h1>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getTargetImage(String html) {
    String result = "";

    List<String> regs = [
      r'(?<=<link as="image" href=")(.*?)(?=")',
      r'(?<=<img alt="product" src=")(.*?)(?=\">)'
    ];

    for (var reg in regs) {
      RegExp exp = RegExp(reg);
      RegExpMatch? match = exp.firstMatch(html);

      if (match != null && result.isEmpty) {
        var element = match[0];
        if (element != null && element.isNotEmpty) {
          result = element.trim();
        }
      }
    }

    return result;
  }

  String getTargetPrice(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<span data-test="product-price".*?>)(.*?)(?=\<\/span>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getMacysTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:title".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    var title = match![0];
    if (title != null && title.isNotEmpty) {
      result = title.trim();
    }

    return result;
  }

  String getMacysImage(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:image".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getMacysPrice(String html) {
    String result = "";

    List<String> regs = [
      r'(?<=<div class="lowest-sale-price">)([\S\s]*?)(?=<\/div>)',
      r'(<script id="productMktData" type="application\/ld\+json">)(.*?)(<\/script>)',
      r'[\$\£\€](\d+(?:\.\d{1,2})?)'
    ];

    for (var reg in regs) {
      RegExp exp = RegExp(reg);
      RegExpMatch? match = exp.firstMatch(html);

      if (match != null && result.isEmpty) {
        var element = match[0];
        if (element != null && element.isNotEmpty) {
          result = element.trim();

          RegExp exp2 = RegExp(r'[\$\£\€](\d+(?:\.\d{1,2})?)');
          RegExpMatch? match2 = exp2.firstMatch(result);

          if (match2 != null) {
            var element2 = match2[0];
            if (element2 != null && element2.isNotEmpty) {
              result = element2.trim();
            }
          }
        }
      }
    }

    return result;
  }

  String getNauticaTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:title".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getNauticaImage(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:image".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getNauticaPrice(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:price".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getKohlsTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:title".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getKohlsImage(String html) {
    String result = "";

    RegExp exp = RegExp(r'(?<=<meta itemprop="image" content=")(.*?)(?=")');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getKohlsPrice(String html) {
    String result = "";

    RegExp exp = RegExp(r'(?<=<meta itemprop="price" content=")(.*?)(?=")');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getSheinTitle(String html) {
    String result = "";

    RegExp exp = RegExp(r'(?<=data-goods_name=")(.*?)(?=")');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getSheinPrice(String html) {
    String result = "";

    RegExp exp = RegExp(r'(?<=data-goods_ga_price=")(.*?)(?=")');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getSheinImage(String html) {
    String result = "";

    RegExp exp = RegExp(r'(?<=data-img=")(.*?)(?=")');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = "https:${element.trim()}";
      }
    }

    return result;
  }

  String getDicksTitle(String html) {
    String result = "";

    RegExp exp = RegExp(r'(?<=<span.*itemprop="name".*?>)(.*?)(?=<\/span>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getDicksPrice(String html) {
    String result = "";

    RegExp exp = RegExp(
        r'(?<=<span.*class="product-price ng-star-inserted".*?>)(.*?)(?=<\/span>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getDicksImage(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<img.*?data-cy="product-image".*?src=")(.*?)(?=")');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getFanaticsTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:title".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getFanaticsImage(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:image".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getFanaticsPrice(String html) {
    String result = "";

    RegExp exp = RegExp(
        r'(?<=<meta.*property="og:price:amount".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getBestBuyTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:title".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getBestBuyImage(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:image".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getBestBuyPrice(String html) {
    String result = "";

    List<String> regs = [
      r'(?<=<div class="priceView-hero-price priceView-customer-price"><span aria-hidden="true">)([\$\£\€](\d+(?:\.\d{1,2})?))(?=<\/span>)',
      r'[\$\£\€](\d+(?:\.\d{1,2})?)'
    ];

    for (var reg in regs) {
      RegExp exp = RegExp(reg);
      RegExpMatch? match = exp.firstMatch(html);

      if (match != null && result.isEmpty) {
        var element = match[0];
        if (element != null && element.isNotEmpty) {
          result = element.trim();
        }
      }
    }

    return result;
  }

  String getVictoriaTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:title".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getVictoriaImage(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*property="og:image".*?content=")(.*?)(?=\".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getVictoriaPrice(String html) {
    String result = "";

    List<String> regs = [
      r'(?<=<div.*?data-testid="ProductPrice".*?>)([\$\£\€](\d+(?:\.\d{1,2})?))(?=\<\/span>)',
      r'[\$\£\€](\d+(?:\.\d{1,2})?)'
    ];

    for (var reg in regs) {
      RegExp exp = RegExp(reg);
      RegExpMatch? match = exp.firstMatch(html);

      if (match != null && result.isEmpty) {
        var element = match[0];
        if (element != null && element.isNotEmpty) {
          result = element.trim();
        }
      }
    }

    return result;
  }

  String getBedTitle(String html) {
    String result = "";

    RegExp exp =
        RegExp(r'(?<=<meta.*?content=")(.*?)(?=\".*property="og:title".*?>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  String getBedImage(String html) {
    String result = "";

    RegExp exp = RegExp(r'(<amp-img.*?)()(\/amp-img>)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        RegExp exp2 = RegExp(r'(?<=src=")(.*?)(?=")');
        RegExpMatch? match2 = exp2.firstMatch(element);

        if (match2 != null && result.isEmpty) {
          var element2 = match2[0];
          if (element2 != null && element2.isNotEmpty) {
            result = element2[0];
          }
        }
      }
    }

    return result;
  }

  String getBedPrice(String html) {
    String result = "";

    RegExp exp = RegExp(
        r'(?<=<span class="inlineBlock plpPrice trackPrice priceSale">)(.*?)(?=<)');
    RegExpMatch? match = exp.firstMatch(html);

    if (match != null && result.isEmpty) {
      var element = match[0];
      if (element != null && element.isNotEmpty) {
        result = element.trim();
      }
    }

    return result;
  }

  ScarpData? scrapedData;

  Future<void> readJS() async {
    String html = await controller.evaluateJavascript(
        source: "window.document.getElementsByTagName('html')[0].innerHTML");

    //AMAZON
    RegExp amazonExp = RegExp(r'https:\/\/www\.amazon\.com\/');
    if (amazonExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: "$url?&linkCode=ll2&tag=wg202201-20",
          // url: url,
          title: getAmazonTitle(html),
          price: getAmazonPrice(html),
          image: getAmazonImage(html));
    }

    //WALMART
    RegExp walmartExp = RegExp(r'https:\/\/www\.walmart\.com\/');
    if (walmartExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getWalmartTitle(html),
          price: getWalmartPrice(html),
          image: getWalmartImage(html));
    }

    //LOWES
    RegExp lowesExp = RegExp(r'https:\/\/www\.lowes\.com\/');
    if (lowesExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getLowesTitle(html),
          price: getLowesPrice(html),
          image: getLowesImage(html));
    }

    //APPLE
    RegExp appleExp = RegExp(r'https:\/\/www\.apple\.com\/');
    if (appleExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getAppleTitle(html),
          price: getApplePrice(html),
          image: getAppleImage(html));
    }

    //TARGET
    RegExp targetExp = RegExp(r'https:\/\/www\.target\.com\/');
    if (targetExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getTargetTitle(html),
          price: getTargetPrice(html),
          image: getTargetImage(html));
    }

    //MACYS
    RegExp macysExp = RegExp(r'https:\/\/www\.macys\.com\/');
    if (macysExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getMacysTitle(html),
          image: getMacysImage(html),
          price: getMacysPrice(html));
    }

    //NAUTICA
    RegExp nauticaExp = RegExp(r'https:\/\/www\.nautica\.com\/');
    if (nauticaExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getNauticaTitle(html),
          image: getNauticaImage(html),
          price: getNauticaPrice(html));
    }

    //SHEIN
    RegExp sheinExp = RegExp(r'https:\/\/.*?shein\.com\/');
    if (sheinExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getSheinTitle(html),
          image: getSheinImage(html),
          price: getSheinPrice(html));
    }

    //DICKS
    RegExp dicksExp = RegExp(r'https:\/\/www\.dickssportinggoods\.com\/');
    if (dicksExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getDicksTitle(html),
          image: getDicksImage(html),
          price: getDicksPrice(html));
    }

    //FANATICS
    RegExp fanaticsExp = RegExp(r'https:\/\/www\.fanatics\.com\/');
    if (fanaticsExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getFanaticsTitle(html),
          image: getFanaticsImage(html),
          price: getFanaticsPrice(html));
    }

    //BESTBUY
    RegExp bestbuyExp = RegExp(r'https:\/\/www\.bestbuy\.com\/');
    if (bestbuyExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getBestBuyTitle(html),
          image: getBestBuyImage(html),
          price: getBestBuyPrice(html));
    }

    //KOHLS
    RegExp kohlsExp = RegExp(r'https:\/\/.*?kohls\.com\/');
    if (kohlsExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getKohlsTitle(html),
          price: getKohlsPrice(html),
          image: getKohlsImage(html));
    }

    //VICTORIA
    RegExp victoriaExp = RegExp(r'https:\/\/.*?victoriassecret\.com\/');
    if (victoriaExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getVictoriaTitle(html),
          price: getVictoriaPrice(html),
          image: getVictoriaImage(html));
    }

    //BED BATH
    RegExp bedExp = RegExp(r'https:\/\/.*?bedbathandbeyond\.com\/');
    if (bedExp.hasMatch(url)) {
      scrapedData = ScarpData(
          id: Utility.generateId(),
          url: url,
          title: getBedTitle(html),
          price: getBedPrice(html),
          image: getBedImage(html));
    }
    // return scrapedData;
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      //AMAZON
      RegExp amazonExp = RegExp(r'https:\/\/www\.amazon\.com\/');
      if (amazonExp.hasMatch(url)) {
        url = "$url?&linkCode=ll2&tag=wg202201-20";
        log("URL is here $url");
        // setState(() {});
      }
    });
    // Future.delayed(const Duration(milliseconds: 500,(){}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () async {
              final url = await controller.getUrl();
              log("URL FROM ${url.toString()}}");
              log("URL FROM Initial ${widget.initialUrl.toString()}");
              if (url.toString() == widget.initialUrl.toString()) {
                context.pop();
              } else {
                await controller.goBack();
              }
            }),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: GestureDetector(
                  onTap: () async {
                    await readJS();
                    // final proceed = await showDialog<bool>(
                    //       context: context,
                    //       builder: (context) => AlertDialog(
                    //         title:
                    //             const Center(child: Text('Add to Wishlist?')),
                    //         icon: const Icon(
                    //           Icons.warning_amber_sharp,
                    //           size: 35,
                    //           color: kPrimaryColor,
                    //         ),
                    //         content: const Text(
                    //           'Make sure the item you have landed on, is a valid product otherwise the system will fail to recongnize it.',
                    //         ),
                    //         actions: [
                    //           ElevatedButton(
                    //               onPressed: () =>
                    //                   Navigator.pop(context, false),
                    //               style: ElevatedButton.styleFrom(
                    //                   backgroundColor: Colors.red),
                    //               child: const Text('Cancel')),
                    //           ElevatedButton(
                    //             onPressed: () {},
                    //             child: const Text('Proceed'),
                    //           )
                    //         ],
                    //       ),
                    //     ) ??
                    //     false;
                    log("dAta ${scrapedData.toString()}");
                    // log(scrapedData?.price.toString());
                    // log(scrapedData?.image.toString());
                    final uri = Uri.parse(url);
                    // if (!uri.pathSegments.contains("dp")) {
                    //   context.pop();
                    //   return context.showSnackbar(
                    //       "Invalid product selected. Please try again with a valid product",
                    //       isError: true);
                    // }
                    // Navigator.pop(context);
                    widget.onNavigationChanged.call(scrapedData!);
                    // old if proceed &&
                    if (scrapedData != null) {
                      context.pop();
                      widget.onNavigationChanged(scrapedData!);
                    }
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: [
                        Text(
                          "Wish",
                          style: GoogleFonts.poppins(
                            height: 0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.add, size: 18, color: Colors.white),
                      ],
                    ),
                  )),
            ),
          ),
        ],
        title: Text(Uri.parse(url).host),
      ),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(url)),
          onUpdateVisitedHistory: (controller, url, androidIsReload) {
            log("URL: $url");
            setState(() {
              this.url = url.toString();
            });
          },
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
          iosOnNavigationResponse: (controller, navigationResponse) {
            return Future.value(IOSNavigationResponseAction.ALLOW);
          },
          onLoadStop: (controller, url) async {
            print("boom");
            // await readJS();
          },

          // javascriptMode: JavascriptMode.unrestricted,
          // initialUrl: url,
          // initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
          // navigationDelegate: (request) {
          //   url = request.url;
          //   print(url);
          //   return NavigationDecision.navigate;
          // },
        ),
      ),
    );
  }
}

class ScarpData {
  String id;
  String url;
  String? title;
  String? image;
  String? price;

  ScarpData({
    required this.id,
    required this.url,
    this.image,
    this.price,
    this.title,
  });
}
