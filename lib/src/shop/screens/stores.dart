import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/common/widgets/search_field.dart';
import 'package:wegift/constants/stores_data.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/web_view.dart/screens/web_view_screen.dart';
import 'package:wegift/src/bottom_nav_bar/screen/app_bottom_nav.dart';
import 'package:wegift/src/profile/screens/add_wishlist_details.dart';
import 'package:wegift/src/profile/screens/profile.dart';

class Stores extends StatefulWidget {
  const Stores({required this.storeScreenArgs, Key? key}) : super(key: key);

  final StoreScreenArgs storeScreenArgs;
  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<StoreModel> stores = StoresData.stores;
    List<StoreModel> giftCards = StoresData.giftCards;
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      appBar: CustomAppBar(
        title: widget.storeScreenArgs.isStore ? "Shop Store" : "Gift Cards",
        backBtn: true,
        elevation: 0.5,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SearchField(
                  controller: searchController,
                  onChanged: (value) {
                    if (widget.storeScreenArgs.isStore) {
                      setState(() {
                        stores = StoresData.stores
                            .where((element) => element.storeName
                                .toLowerCase()
                                .startsWith(value.toLowerCase()))
                            .toList();
                      });
                    } else {
                      setState(() {
                        giftCards = StoresData.giftCards
                            .where((element) => element.storeName
                                .toLowerCase()
                                .startsWith(value.toLowerCase()))
                            .toList();
                      });
                    }
                  },
                  isTextCentered: false,
                ),
              ),
              Expanded(
                child: Builder(builder: (context) {
                  return GridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: widget.storeScreenArgs.isStore ? 3 : 2,
                    children: List.generate(
                      widget.storeScreenArgs.isStore
                          ? stores.length
                          : giftCards.length,
                      (index) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.to(
                                Scaffold(
                                  bottomNavigationBar: const AppBottomNav(),
                                  body: WishlistWebview(
                                    initialUrl: widget.storeScreenArgs.isStore
                                        ? stores[index].storeUrl
                                        : giftCards[index].storeUrl,
                                    onNavigationChanged: (scrapedData) async {
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
                                          title: scrapedData.title);
                                      // final assembledWishlist =
                                      //     controller.assembleWishlistItem(url);
                                      // context.pop();
                                      context.to(
                                          AddWishlistDetails(item: wishist));
                                      // await controller.addToWishlist(wishist);
                                    },
                                    javascriptMode: JavascriptMode.unrestricted,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: widget.storeScreenArgs.isStore
                                  ? 80
                                  : context.height * 0.15,
                              width: widget.storeScreenArgs.isStore
                                  ? 80
                                  : context.width / 2.3,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      widget.storeScreenArgs.isStore
                                          ? stores[index].assetPath
                                          : giftCards[index].assetPath),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            widget.storeScreenArgs.isStore
                                ? stores[index].storeName
                                : giftCards[index].storeName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StoreScreenArgs {
  bool isStore;
  StoreScreenArgs({required this.isStore});
}
