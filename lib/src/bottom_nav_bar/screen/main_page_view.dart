import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/src/bottom_nav_bar/screen/app_bottom_nav.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/home/screens/home.dart';
import 'package:wegift/src/profile/screens/profile.dart';
import 'package:wegift/src/search/screens/search.dart';
import 'package:wegift/src/shop/screens/shop.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      body: PageView(
        controller: context.read<HomeController>().pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Home(),
          Search(),
          Shop(),
          Profile(),
        ],
      ),
    );
  }
}
