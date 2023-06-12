import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final controller = context.watch<HomeController>();
      return Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  checkCurrentRoute(context, 0);
                  // context.read<HomeController>().updateBarIndex(0);
                },
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: controller.barIndex == 0
                      ? Colors.black
                      : Colors.grey.shade500,
                ),
              ),
              IconButton(
                onPressed: () {
                  checkCurrentRoute(context, 1);
                  // context.read<HomeController>().updateBarIndex(1);
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: controller.barIndex == 1
                      ? Colors.black
                      : Colors.grey.shade500,
                ),
              ),
              IconButton(
                onPressed: () {
                  checkCurrentRoute(context, 2);
                  // context.read<HomeController>().updateBarIndex(2);
                },
                icon: Icon(
                  CupertinoIcons.bag,
                  size: 30,
                  color: controller.barIndex == 2
                      ? Colors.black
                      : Colors.grey.shade500,
                ),
              ),
              IconButton(
                onPressed: () {
                  checkCurrentRoute(context, 3);
                },
                icon: Icon(
                  Icons.person_outline,
                  size: 30,
                  color: controller.barIndex == 3
                      ? Colors.black
                      : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void checkCurrentRoute(BuildContext context, int index) async {
    final route = ModalRoute.of(context)?.settings.name;
    log(route.toString());
    if (ModalRoute.of(context)?.settings.name != AppRouter.mainPageView) {
      context.read<HomeController>().updateBarIndex(index);
      Navigator.of(context)
          .popUntil(ModalRoute.withName(AppRouter.mainPageView));
    } else {
      context.read<HomeController>().updateBarIndex(index);
    }
  }
}
