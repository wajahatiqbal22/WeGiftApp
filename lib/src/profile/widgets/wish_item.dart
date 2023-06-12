import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegift/common/widgets/buttons/common_post_login_button.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';

class WishItem extends StatelessWidget {
  const WishItem({
    Key? key,
    required this.wishlist,
    required this.btnText,
    required this.optionIcon,
    this.btnBorderRadius,
    this.isBtnFilled,
    this.isButtonEnabled = true,
    this.onOpen,
    this.optionalActions,
    required this.onReserveClicked,
  }) : super(key: key);
  final String btnText;
  final double? btnBorderRadius;
  final bool? isBtnFilled;
  final bool optionIcon;
  final bool isButtonEnabled;
  final Function()? onReserveClicked;
  final Wishlist wishlist;
  final List<PopupMenuEntry>? optionalActions;
  final Function()? onOpen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onOpen,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          child: Column(
            children: [
              optionIcon
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PopupMenuButton(
                          child: const Icon(Icons.more_horiz),
                          itemBuilder: (context) {
                            return optionalActions?.map((e) => e).toList() ??
                                [];
                          },
                        ),
                      ],
                    )
                  : const SizedBox(),

              if (wishlist.productImage != null &&
                  wishlist.productImage!.isNotEmpty)
                SizedBox(
                    height: context.height * 0.2,
                    child: Image.network(
                      wishlist.productImage!.first,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(CupertinoIcons.gift, size: 50);
                      },
                    )),

              Text(
                wishlist.title ?? "Wishlist Item",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              // if (wishlist.price != null)
              const SizedBox(height: 8),
              Text(
                wishlist.price ?? "Price unavailable",
                style: GoogleFonts.poppins(
                    fontSize: 12, fontStyle: FontStyle.italic),
              ),
              wishlist.details != null
                  ? Text(
                      wishlist.details!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(fontSize: 14),
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              if (isButtonEnabled)
                CommonPostLoginButton(
                  btnText: btnText,
                  isFilled: isBtnFilled,
                  borderRadius: btnBorderRadius,
                  onTap: onReserveClicked,
                )
            ],
          ),
        ),
      ),
    );
  }
}
