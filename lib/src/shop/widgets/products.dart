import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/bottom_nav_bar/screen/app_bottom_nav.dart';
import 'package:wegift/src/profile/screens/add_wishlist_details.dart';
import 'package:wegift/src/profile/screens/profile.dart';

class Product extends StatelessWidget {
  const Product(
      {Key? key,
      required this.prodcutName,
      this.price,
      this.height,
      this.url,
      this.assetPath,
      required this.webUrl})
      : super(key: key);
  final String prodcutName;
  final String? price;
  final double? height;
  final String webUrl;
  final String? url;
  final String? assetPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.to(
          Scaffold(
            bottomNavigationBar: AppBottomNav(),
            body: WishlistWebview(
              initialUrl: webUrl,
              onNavigationChanged: (scrapedData) async {
                final controller = context.read<AuthController>();
                final wishist = Wishlist(
                    link: scrapedData.url,
                    id: scrapedData.id,
                    productImage:
                        scrapedData.image != null ? [scrapedData.image!] : [],
                    price: scrapedData.price,
                    title: scrapedData.title);
                // final assembledWishlist =
                //     controller.assembleWishlistItem(url);
                // context.pop();
                context.to(AddWishlistDetails(item: wishist));
                // await controller.addToWishlist(wishist);
              },
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        );
        // context.toNamed(
        //   AppRouter.wis,
        //   arguments: WebViewScreenArgs(
        //     initialUrl: webUrl,
        //     onNavigated: (navigatedUrl) {
        //       log(navigatedUrl.toString());
        //     },
        //   ),
        // );
      },
      child: Column(
        children: [
          assetPath == null
              ? SizedBox(
                  height: height ?? context.height * 0.12,
                  child: Image.network(url!),
                )
              : SizedBox(
                  height: height ?? context.height * 0.12,
                  child: Image.asset(assetPath!),
                ),
          const SizedBox(height: 10),
          Text(
            prodcutName,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          price != null
              ? Text(
                  price!,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
