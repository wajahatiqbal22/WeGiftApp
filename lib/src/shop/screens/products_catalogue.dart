import 'package:flutter/material.dart';
import 'package:wegift/common/widgets/custom_app_bar.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/app/bootstrap/app_links/app_links.dart';
import 'package:wegift/src/bottom_nav_bar/screen/app_bottom_nav.dart';
import 'package:wegift/src/shop/widgets/products.dart';

class ProductsCatalogue extends StatelessWidget {
  const ProductsCatalogue({Key? key, required this.args}) : super(key: key);
  final ProductsCatalogueArgs args;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      appBar: CustomAppBar(
        title: args.title,
        backBtn: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                children: List.generate(
                  args.links.length,
                  (index) {
                    final applink = args.links[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Product(
                        url: applink.pictureUrl,
                        prodcutName: applink.name,
                        height: context.height * 0.22,
                        webUrl: applink.link,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductsCatalogueArgs {
  final String title;
  final List<AppLinks> links;

  ProductsCatalogueArgs({
    required this.title,
    required this.links,
  });
}
