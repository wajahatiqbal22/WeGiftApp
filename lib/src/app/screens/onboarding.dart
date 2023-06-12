import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/colors.dart';
import 'package:wegift/common/widgets/social_svg_buttons.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/services/notifiers/auth_state.dart';
import 'package:wegift/src/auth/screens/login/otp_verification.dart';
import 'package:wegift/src/home/controllers/home_controller.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  PhoneNumber phoneNumber = PhoneNumber(isoCode: "US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        final controller = context.read<AuthController>();
        return Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/happy_birthday.jpeg",
                  height: context.height * 0.42,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Column(
                children: [
                  Builder(builder: (context) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      context.read<AuthController>().stateNotifier = (state) {
                        state.maybeWhen(
                          orElse: () {},
                          loggedIn: (user) {
                            log("HERE");
                            context.read<HomeController>().initialize();
                            if (user.userDetails != null) {
                              context.off(AppRouter.mainPageView);
                            } else {
                              context.off(AppRouter.registration);
                            }
                          },
                          loggingIn: (t) {},
                          noUser: () {
                            context.toNamed(AppRouter.registration);
                          },
                          error: (e) {
                            log(e.toString());
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  e.message ??
                                      "There was an error signing in. Try again!",
                                  style: const TextStyle(color: Colors.white)),
                              backgroundColor: Colors.red,
                            ));
                          },
                          logOut: () {
                            // context.toNamed(AppRouter.onboarding);
                            // context.read<HomeController>().clear();
                          },
                          otpSent: (String phoneNumber, String verificationId) {
                            context.toNamed(AppRouter.otpVerification,
                                arguments: OtpVerificationArgs(
                                    phoneNumber: phoneNumber,
                                    verificationId: verificationId));
                          },
                        );
                      };
                    });

                    return const SizedBox();
                  }),
                  SizedBox(height: context.height * 0.4),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        width: double.infinity,
                        height: context.height * 0.6,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bringing you closer to people you love!',
                              style: context.textTheme.titleMedium,
                            ),
                            Text(
                              'WeGift',
                              style: context.textTheme.headline4?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Container(),
                            Builder(builder: (context) {
                              bool isLoading = false;
                              context
                                  .select((AuthController con) => con.state)
                                  .maybeWhen(
                                      loggingIn: (t) =>
                                          isLoading = t == AuthType.google,
                                      orElse: () {});
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: SocialSvgButton(
                                  isLoading: isLoading,
                                  text: 'Login with Google',
                                  svg: SvgPicture.asset(
                                      'assets/icons/google.svg'),
                                  onPressed: () => controller.signInWithGoogle(
                                      isFromSignup: true),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 1, color: kPrimaryColor),
                                  ),
                                ),
                              );
                            }),
                            if (Platform.isIOS)
                              Builder(builder: (context) {
                                bool isLoading = false;
                                context
                                    .select((AuthController con) => con.state)
                                    .maybeWhen(
                                        loggingIn: (t) =>
                                            isLoading = t == AuthType.apple,
                                        orElse: () {});
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: SocialSvgButton(
                                    isLoading: isLoading,
                                    text: 'Login with Apple',
                                    svg: SvgPicture.asset(
                                        'assets/icons/apple.svg'),
                                    onPressed: () => controller.signInWithApple(
                                        isFromSignup: true),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        width: 1,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            Builder(builder: (context) {
                              bool isLoading = false;
                              context
                                  .select((AuthController con) => con.state)
                                  .maybeWhen(
                                      loggingIn: (t) =>
                                          isLoading = t == AuthType.facebook,
                                      orElse: () {});
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: SocialSvgButton(
                                  isLoading: isLoading,
                                  text: 'Login with Facebook',
                                  svg: SvgPicture.asset(
                                      'assets/icons/facebook.svg'),
                                  onPressed: () => controller
                                      .signInWithFacebook(isFromSignup: true),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 1, color: kPrimaryColor),
                                  ),
                                ),
                              );
                            }),
                            Row(
                              children: const [
                                Expanded(
                                  child: Divider(thickness: 1),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 32.0),
                                  child: Text('OR'),
                                ),
                                Expanded(
                                  child: Divider(thickness: 1),
                                ),
                              ],
                            ),
                            Builder(builder: (context) {
                              return Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // TextFormField(
                                    //   validator: (v) {
                                    //     final regex = RegExp(
                                    //         r"\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$");

                                    //     if (!regex.hasMatch(v!)) {
                                    //       return "Invalid phone number.";
                                    //     }
                                    //     return null;
                                    //   },
                                    //   controller: phoneController,
                                    //   inputFormatters: const [
                                    //     // MaskTextInputFormatter(
                                    //     //     mask: '+# (###) ###-####',
                                    //     //     filter: {"#": RegExp(r'[0-9]')},
                                    //     //     type: MaskAutoCompletionType.lazy),
                                    //   ],
                                    //   decoration: InputDecoration(
                                    //     label: const Padding(
                                    //       padding: EdgeInsets.only(left: 12.0),
                                    //       child: Text('Phone'),
                                    //     ),
                                    //     hintText: '+1 (000) 000 - 0000',
                                    //     isDense: true,
                                    //     border: OutlineInputBorder(
                                    //       borderRadius: BorderRadius.circular(50),
                                    //     ),
                                    //     suffixIcon: const Icon(
                                    //       Icons.phone,
                                    //       size: 25,
                                    //     ),
                                    //   ),
                                    // ),
                                    Builder(builder: (context) {
                                      return InternationalPhoneNumberInput(
                                        initialValue: phoneNumber,
                                        formatInput: false,
                                        validator: (v) {
                                          final regex = RegExp(
                                              r"\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$");
                                          // if (!regex.hasMatch(_phone.text)) {
                                          //   return "Invalid phone number.";
                                          // }
                                          if (phoneController.text.length <
                                              11) {
                                            return "Invalid phone number";
                                          }
                                          return null;
                                        },
                                        ignoreBlank: true,
                                        onInputChanged: (phoneNumber) {
                                          phoneController.text =
                                              phoneNumber.phoneNumber ?? "";
                                        },
                                        maxLength: 15,
                                        selectorConfig: const SelectorConfig(
                                            selectorType: PhoneInputSelectorType
                                                .BOTTOM_SHEET),
                                      );
                                    }),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        minimumSize: context.value<Size>(
                                            const Size(double.infinity, 50)),
                                        shape: context.value<OutlinedBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50))),
                                      ),
                                      onPressed: () {
                                        if (formKey.currentState?.validate() ??
                                            false) {
                                          context
                                              .read<AuthController>()
                                              .loginWithPhoneNumber(
                                                  phoneController.text);
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          "Continue",
                                          style: context.textTheme.button
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

enum SocialLoginAction { google, facebook, apple }

class _SocialButtons extends StatelessWidget {
  const _SocialButtons({Key? key, required this.onSocialClick})
      : super(key: key);

  final Function(SocialLoginAction) onSocialClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SocialSvgButton(
            text: 'Login with Google',
            svg: SvgPicture.asset('assets/icons/google.svg'),
            onPressed: () => onSocialClick(SocialLoginAction.google),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 1, color: kPrimaryColor),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SocialSvgButton(
            text: 'Login with Apple',
            svg: SvgPicture.asset('assets/icons/apple.svg'),
            onPressed: () => onSocialClick(SocialLoginAction.apple),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 1,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SocialSvgButton(
            text: 'Login with Facebook',
            svg: SvgPicture.asset('assets/icons/facebook.svg'),
            onPressed: () => onSocialClick(SocialLoginAction.facebook),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 1, color: kPrimaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
