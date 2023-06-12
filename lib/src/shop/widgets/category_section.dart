import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegift/constants/stores_data.dart';
import 'package:wegift/src/app/bootstrap/app_links/app_links.dart';
import 'package:wegift/src/shop/widgets/products.dart';

class CategorySection extends StatelessWidget {
  const CategorySection(
      {Key? key,
      required this.categoryName,
      required this.viewAllTap,
      this.links,
      this.stores,
      this.titleFontSize = 20,
      this.actionFontSize = 20})
      : super(key: key);
  final String categoryName;
  final List<AppLinks>? links;
  final List<StoreModel>? stores;
  final Function()? viewAllTap;
  final double titleFontSize;
  final double actionFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: viewAllTap,
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Text(
                          "View All",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: actionFontSize,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 10)),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          links != null
              ? Row(
                  children: List.generate(
                  links!.length > 2 ? 3 : 0,
                  (index) {
                    final link = links![index];
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Product(
                          webUrl: link.link,
                          prodcutName: link.name,
                          price: "",
                          url: link.pictureUrl,
                        ),
                      ),
                    );
                  },
                ).toList())
              : stores != null
                  ? Row(
                      children: List.generate(
                      stores!.length > 2 ? 3 : 0,
                      (index) {
                        final store = stores![index];
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Product(
                              assetPath: store.assetPath,
                              prodcutName: store.storeName,
                              webUrl: store.storeUrl,
                              price: "",
                              url: store.assetPath,
                            ),
                          ),
                        );
                      },
                    ).toList())
                  : SizedBox(),
        ],
      ),
    );
  }
}
