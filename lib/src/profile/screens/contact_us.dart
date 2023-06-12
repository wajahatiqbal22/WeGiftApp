import 'package:flutter/material.dart';

import 'package:wegift/common/widgets/common_tiles.dart';

import 'package:wegift/common/widgets/custom_app_bar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Contact Us", backBtn: true),
      body: Column(
        children: [
          CommonTiles(
              text: "Feature Request", onTileTap: () {}, leadingIcon: null),
          CommonTiles(text: "Help", onTileTap: () {}, leadingIcon: null),
        ],
      ),
    );
  }
}
