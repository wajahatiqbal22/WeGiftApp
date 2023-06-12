import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/widgets/signup/app_bar/register_app_bar.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegisterScreenAppBar(
        onBack: () {
          final controller = context.read<AuthController>();
          _pageController.previousPage(
              duration: const Duration(milliseconds: 250),
              curve: Curves.linear);
          if (RegisterState.values.indexOf(controller.getRegisterState) != 0) {
            controller.registerState = RegisterState.values[
                RegisterState.values.indexOf(controller.getRegisterState) - 1];
          } else {
            controller.logout();
            context.offAll(AppRouter.onboarding);
          }
        },
        onNext: () => _pageController.nextPage(
            duration: const Duration(milliseconds: 250), curve: Curves.linear),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: RegisterState.values.map((e) {
              return e.widget(onNext: () {
                context.read<AuthController>().registerState =
                    RegisterState.values[RegisterState.values.indexOf(e) + 1];
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear);
              });
            }).toList(),
          ),
        ),
      ),
    );
  }
}
