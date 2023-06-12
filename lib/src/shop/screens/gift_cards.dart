import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/extensions/string_extension.dart';
import 'package:wegift/src/app/bootstrap/app_links/app_links.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/bottom_nav_bar/screen/app_bottom_nav.dart';
import 'package:wegift/src/shop/screens/products_catalogue.dart';
import 'package:wegift/src/shop/widgets/category_section.dart';

class GiftCards extends StatelessWidget {
  const GiftCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final bootstrapController = context.read<Bootstrap>();
      return Scaffold(
        bottomNavigationBar: AppBottomNav(),
        appBar: const CustomAppBar(
          title: "Popular Cards",
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
                      SubCategory.popular_birthday,
                      SubCategory.funny_birthday,
                      SubCategory.christmas,
                      SubCategory.valentines_day,
                      SubCategory.mothers_day,
                      SubCategory.fathers_day
                    ]
                            .map((e) => CategorySection(
                                titleFontSize: 16,
                                actionFontSize: 16,
                                categoryName: e.formattedName,
                                viewAllTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/productsCatalogue',
                                    arguments: ProductsCatalogueArgs(
                                        title: e.formattedName,
                                        links: bootstrapController.links
                                            .where((element) =>
                                                element.subCategory == e)
                                            .toList()),
                                  );
                                },
                                links: bootstrapController.links
                                    .where(
                                        (element) => element.subCategory == e)
                                    .toList()
                                  ..shuffle()))
                            .toList()
                        //  [
                        //   CategorySection(
                        //     links: bootstrapController.links
                        //         .where((element) => element.subCategory == SubCategory.popular_birthday)
                        //         .toList()
                        //       ..shuffle(),
                        //     categoryName: "For Her",
                        //     viewAllTap: () {
                        //       Navigator.pushNamed(
                        //         context,
                        //         '/productsCatalogue',
                        //         arguments: ProductsCatalogueArgs(
                        //             title: "For Her",
                        //             links: bootstrapController.links
                        //                 .where(
                        //                     (element) => element.subCategory == SubCategory.funny_birthday)
                        //                 .toList()
                        //               ..shuffle()),
                        //       );
                        //     },
                        //   ),
                        //   Builder(builder: (context) {
                        //     final links = bootstrapController.links
                        //         .where((element) => element.subCategory == SubCategory.mothers_day)
                        //         .toList()
                        //       ..shuffle();
                        //     return CategorySection(
                        //       links: links,
                        //       categoryName: "For Him",
                        //       viewAllTap: () {
                        //         Navigator.pushNamed(
                        //           context,
                        //           '/productsCatalogue',
                        //           arguments: ProductsCatalogueArgs(
                        //             title: "For Him",
                        //             links: links,
                        //           ),
                        //         );
                        //       },
                        //     );
                        //   }),
                        // ],
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

extension SubCategoryExtension on SubCategory {
  String get formattedName {
    List<String> splitted = name.split("_");
    splitted = splitted.map((e) => e.capitalizeFirstLetter).toList();
    return "${splitted.join(" ")} Cards";
  }
}
