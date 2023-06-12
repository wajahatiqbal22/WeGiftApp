import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/src/app/bootstrap/app_links/app_links.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/shop/screens/products_catalogue.dart';
import 'package:wegift/src/shop/widgets/category_section.dart';

class PopularGift extends StatelessWidget {
  const PopularGift({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final bootstrapController = context.read<Bootstrap>();
      return Scaffold(
        appBar: const CustomAppBar(
          title: "Popular Gifts",
          backBtn: true,
          elevation: 0.5,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Builder(builder: (context) {
                          final links = bootstrapController.links
                              .where((element) =>
                                  element.subCategory == SubCategory.popular)
                              .toList()
                            ..shuffle();
                          return CategorySection(
                            links: links,
                            categoryName: "Popular Gifts",
                            viewAllTap: () {
                              Navigator.pushNamed(
                                context,
                                '/productsCatalogue',
                                arguments: ProductsCatalogueArgs(
                                  title: "Popular",
                                  links: links,
                                ),
                              );
                            },
                          );
                        }),
                        CategorySection(
                          links: bootstrapController.links
                              .where((element) =>
                                  element.subCategory == SubCategory.for_her)
                              .toList()
                            ..shuffle(),
                          categoryName: "For Her",
                          viewAllTap: () {
                            Navigator.pushNamed(
                              context,
                              '/productsCatalogue',
                              arguments: ProductsCatalogueArgs(
                                  title: "For Her",
                                  links: bootstrapController.links
                                      .where((element) =>
                                          element.subCategory ==
                                          SubCategory.for_her)
                                      .toList()
                                    ..shuffle()),
                            );
                          },
                        ),
                        Builder(builder: (context) {
                          final links = bootstrapController.links
                              .where((element) =>
                                  element.subCategory == SubCategory.for_him)
                              .toList()
                            ..shuffle();
                          return CategorySection(
                            links: links,
                            categoryName: "For Him",
                            viewAllTap: () {
                              Navigator.pushNamed(
                                context,
                                '/productsCatalogue',
                                arguments: ProductsCatalogueArgs(
                                  title: "For Him",
                                  links: links,
                                ),
                              );
                            },
                          );
                        }),
                        Builder(builder: (context) {
                          final links = bootstrapController.links
                              .where((element) =>
                                  element.subCategory == SubCategory.for_kids)
                              .toList()
                            ..shuffle();
                          return CategorySection(
                            links: links,
                            categoryName: "Kids",
                            viewAllTap: () {
                              Navigator.pushNamed(
                                context,
                                '/productsCatalogue',
                                arguments: ProductsCatalogueArgs(
                                  title: "Kids",
                                  links: links,
                                ),
                              );
                            },
                          );
                        }),
                        Builder(builder: (context) {
                          final links = bootstrapController.links
                              .where((element) =>
                                  element.subCategory ==
                                  SubCategory.valentines_day)
                              .toList()
                            ..shuffle();
                          return CategorySection(
                            links: links,
                            categoryName: "Valentine's Day",
                            viewAllTap: () {
                              Navigator.pushNamed(
                                context,
                                '/productsCatalogue',
                                arguments: ProductsCatalogueArgs(
                                  title: "Valentine's Day",
                                  links: links,
                                ),
                              );
                            },
                          );
                        }),
                        Builder(builder: (context) {
                          final links = bootstrapController.links
                              .where((element) =>
                                  element.subCategory ==
                                  SubCategory.mothers_day)
                              .toList()
                            ..shuffle();
                          return CategorySection(
                            links: links,
                            categoryName: "Mother's Day",
                            viewAllTap: () {
                              Navigator.pushNamed(
                                context,
                                '/productsCatalogue',
                                arguments: ProductsCatalogueArgs(
                                  title: "Mother's Day",
                                  links: links,
                                ),
                              );
                            },
                          );
                        }),
                        Builder(builder: (context) {
                          final links = bootstrapController.links
                              .where((element) =>
                                  element.subCategory == SubCategory.pet)
                              .toList()
                            ..shuffle();
                          return CategorySection(
                            links: links,
                            categoryName: "Pets",
                            viewAllTap: () {
                              Navigator.pushNamed(
                                context,
                                '/productsCatalogue',
                                arguments: ProductsCatalogueArgs(
                                  title: "Pets",
                                  links: links,
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
