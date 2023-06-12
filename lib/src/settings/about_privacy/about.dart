import 'package:flutter/material.dart';

import 'package:wegift/common/widgets/common_tiles.dart';

import 'package:wegift/common/widgets/custom_app_bar.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "About", backBtn: true),
      body: Column(
        children: [
          CommonTiles(
              text: "Privacy Policy",
              onTileTap: () {
                Navigator.pushNamed(context, '/privacyPolicy');
              },
              leadingIcon: null),
          CommonTiles(
              text: "Terms of Service",
              onTileTap: () {
                Navigator.pushNamed(context, '/termsOfServices');
              },
              leadingIcon: null),
        ],
      ),
    );
  }
}
