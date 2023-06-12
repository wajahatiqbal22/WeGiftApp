import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/constants/stores_data.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/app/bootstrap/app_links/app_links.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/shop/screens/gift_cards.dart';
import 'package:wegift/src/shop/screens/popular_gifts.dart';
import 'package:wegift/src/shop/screens/products_catalogue.dart';
import 'package:wegift/src/shop/screens/stores.dart';
import 'package:wegift/src/shop/widgets/category_section.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: "Shop",
            backBtn: false,
            elevation: 0.5,
          ),
          Expanded(
            child: Builder(builder: (context) {
              final List<AppLinks> links = context.watch<Bootstrap>().links;
              log(links.length.toString());
              // context.select((Bootstrap value) => value.links);

              bool isLoading =
                  context.select((Bootstrap value) => value.isLoading);

              if (links.isEmpty && !isLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Something went wrong while fetching the stores! Please retry.",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: const Text("Retry"),
                        onPressed: () {
                          context.read<Bootstrap>().getAppConfig();
                        },
                      ),
                    ],
                  ),
                );
              }

              return isLoading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            CategorySection(
                              links: links
                                  .where((e) => e.category == Category.card)
                                  .toList()
                                ..shuffle(),
                              categoryName: "Cards",
                              viewAllTap: () {
                                context.to(const GiftCards());
                              },
                            ),
                            CategorySection(
                              links: links
                                  .where((e) => e.category == Category.gift)
                                  .toList()
                                ..shuffle(),
                              categoryName: "Gifts",
                              viewAllTap: () {
                                context.to(const PopularGift());
                              },
                            ),
                            Builder(builder: (context) {
                              final stores = StoresData.stores;
                              return CategorySection(
                                stores: stores..shuffle(),
                                categoryName: "Stores",
                                viewAllTap: () {
                                  context.toNamed(AppRouter.stores,
                                      arguments:
                                          StoreScreenArgs(isStore: true));
                                },
                              );
                            }),
                            CategorySection(
                              stores: StoresData.giftCards..shuffle(),
                              categoryName: "Gift Cards",
                              viewAllTap: () {
                                context.toNamed(AppRouter.stores,
                                    arguments: StoreScreenArgs(isStore: false));
                              },
                            ),
                            CategorySection(
                              links: links
                                  .where((e) => e.category == Category.gift)
                                  .toList()
                                ..shuffle(),
                              categoryName: "Popular",
                              viewAllTap: () {
                                context.toNamed(
                                  AppRouter.productsCatalogue,
                                  arguments: ProductsCatalogueArgs(
                                      title: "Popular",
                                      links: links
                                          .where((element) =>
                                              element.category ==
                                              Category.popular)
                                          .toList()),
                                );
                              },
                            ),

                            // CategorySection(
                            //   categoryName: "Stores",
                            //   viewAllTap: () {
                            //     Navigator.pushNamed(
                            //       context,
                            //       '/stores',
                            //     );
                            //   },
                            // ),
                            // CategorySection(
                            //   categoryName: "Gift Cards",
                            //   viewAllTap: () {
                            //     Navigator.pushNamed(
                            //       context,
                            //       '/giftCards',
                            //     );
                            //   },
                            // )
                          ],
                        ),
                      ),
                    );
            }),
          )
        ],
      ),
    );
  }
}
