// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/colors.dart';
import 'package:wegift/src/app/bootstrap/bootstrap.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';
import 'package:wegift/src/profile/controllers/event_controller.dart';
// Project imports:

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Bootstrap(),
      child: Builder(builder: (context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => AuthController(context.read<Bootstrap>(),
                  stateNotifier: (state) {}),
            ),
            ChangeNotifierProvider(
              create: (context) => HomeController(context.read<Bootstrap>()),
            ),
            ChangeNotifierProvider(
              create: (context) => EventController(),
            ),
          ],
          child: GetMaterialApp(
            title: 'WeGift',
            theme: ThemeData(
              colorScheme:
                  ThemeData().colorScheme.copyWith(primary: kPrimaryColor),
              primaryColor: kPrimaryColor,
              focusColor: kPrimaryColor,
              textTheme: GoogleFonts.poppinsTextTheme(),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                actionsIconTheme: IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0,
                foregroundColor: Colors.black,
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            onGenerateRoute: (RouteSettings settings) =>
                AppRouter.onGenerateRoute(settings, context),
          ),
        );
      }),
    );
  }
}
