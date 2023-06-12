import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/colors.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';

import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';

class AddWishlistDetails extends StatefulWidget {
  AddWishlistDetails({super.key, required this.item});

  Wishlist item;

  @override
  State<AddWishlistDetails> createState() => _AddWishlistDetailsState();
}

class _AddWishlistDetailsState extends State<AddWishlistDetails> {
  late final TextEditingController _title =
      TextEditingController(text: widget.item.title);
  late final TextEditingController _price = TextEditingController(
      text: widget.item.price != null && widget.item.price!.isNotEmpty
          ? widget.item.price!.substring(1)
          : "");
  late final TextEditingController _quantity =
      TextEditingController(text: widget.item.quantity.toString());
  late final TextEditingController _details =
      TextEditingController(text: widget.item.details);
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  late final String _currency =
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Wish Details",
                            style: context.textTheme.headlineMedium
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Wish Name"),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              fillColor: Colors.blueGrey[50],
                            ),
                            controller: _title,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Price"),
                                  const SizedBox(height: 10),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        prefixText: _currency,
                                        hintText: '24.99',
                                        border: InputBorder.none,
                                        filled: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 20),
                                        fillColor: Colors.blueGrey[50],
                                      ),
                                      controller: _price,
                                      onChanged: (string) {
                                        string = _formatNumber(
                                            string.replaceAll(',', ''));
                                        _price.value = TextEditingValue(
                                          text: string,
                                          selection: TextSelection.collapsed(
                                              offset: string.length),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Quantity"),
                                  const SizedBox(height: 10),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      decoration: InputDecoration(
                                        hintText: "1",
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 20),
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.blueGrey[50],
                                      ),
                                      controller: _quantity,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text("Wish Details"),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  "For example: `medium size`, `the one in red`, etc",
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              fillColor: Colors.blueGrey[50],
                            ),
                            controller: _details,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Wish Images"),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                child: widget.item.productImage != null &&
                                        widget.item.productImage!.isNotEmpty
                                    ? Image.network(
                                        widget.item.productImage!.first,
                                        // "https://www.nautica.com/dw/image/v2/BDCV_PRD/on/demandware.static/-/Sites-nautica-master-catalog/default/dw7e532068/images/0731516000016_KR5308_709_A.jpg",
                                        headers: const {
                                          'user-agent':
                                              "Mozilla/5.0 Chrome/19.0.1042.0"
                                        },
                                        fit: BoxFit.cover, errorBuilder:
                                            (context, error, stackTrace) {
                                        log("ERRRO ON IMAGE: $error");
                                        return Image.asset(
                                            "assets/icons/app_icon.jpeg");
                                      })
                                    : const SizedBox(),
                              ),
                              const SizedBox(width: 10),
                              // GestureDetector(
                              //   behavior: HitTestBehavior.opaque,
                              //   onTap: () async {
                              //     final xfile =
                              //         await ImagePicker().pickImage(source: ImageSource.gallery);
                              //     if (xfile != null) {
                              //       setState(() {
                              //         file = xfile;
                              //       });
                              //     }
                              //   },
                              //   child: Stack(
                              //     children: [
                              //       Container(
                              //         height: 100,
                              //         width: 100,
                              //         decoration: BoxDecoration(
                              //           color: Colors.blueGrey[50],
                              //           image: file != null
                              //               ? DecorationImage(
                              //                   fit: BoxFit.cover,
                              //                   image: FileImage(File(file!.path)),
                              //                 )
                              //               : null,
                              //         ),
                              //         child: const Center(
                              //           child: Icon(Icons.upload),
                              //         ),
                              //       ),
                              //       file != null
                              //           ? Positioned(
                              //               right: 0,
                              //               top: 0,
                              //               child: CircleAvatar(
                              //                 backgroundColor: Colors.white,
                              //                 child: IconButton(
                              //                     color: Colors.red,
                              //                     onPressed: () {
                              //                       setState(() {
                              //                         file = null;
                              //                       });
                              //                     },
                              //                     icon: const Icon(Icons.delete)),
                              //               ),
                              //             )
                              //           : const SizedBox(),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        isLoading
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    widget.item = widget.item
                                        .copyWith(details: _details.text);
                                    try {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final controller =
                                          context.read<AuthController>();
                                      await controller
                                          .addToWishlist(
                                              assembledWishlist: widget.item,
                                              image: file)
                                          .then((value) {
                                        context.pop();
                                        context
                                            .showSnackbar("Wishlist Updated");
                                      });
                                    } catch (e) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      context.showSnackbar(
                                          "There was an issue adding wish list item.",
                                          isError: true);
                                      rethrow;
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    minimumSize: Size(context.width * 0.9, 44),
                                  ),
                                  child: const Text("Save"),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
