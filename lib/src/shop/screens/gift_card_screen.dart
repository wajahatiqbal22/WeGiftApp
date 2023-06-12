import 'dart:developer';

import 'package:flutter/material.dart';
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

class GiftCardScreen extends StatefulWidget {
  GiftCardScreen({Key? key}) : super(key: key);

  @override
  State<GiftCardScreen> createState() => _GiftCardScreenState();
}

class _GiftCardScreenState extends State<GiftCardScreen> {
  final TextEditingController searchController = TextEditingController();
  List<StoreModel> stores = StoresData.stores;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      appBar: const CustomAppBar(
        title: "Shop Store",
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
                    setState(() {
                      stores = StoresData.stores
                          .where((element) => element.storeName
                              .toLowerCase()
                              .startsWith(value.toLowerCase()))
                          .toList();
                    });
                  },
                  isTextCentered: false,
                ),
              ),
              Expanded(
                child: Builder(builder: (context) {
                  return GridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 3,
                    children: List.generate(
                      stores.length,
                      (index) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.to(
                                Scaffold(
                                  bottomNavigationBar: const AppBottomNav(),
                                  body: WishlistWebview(
                                    initialUrl: stores[index].storeUrl,
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
                                    },
                                    javascriptMode: JavascriptMode.unrestricted,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(stores[index].assetPath),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            stores[index].storeName,
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
