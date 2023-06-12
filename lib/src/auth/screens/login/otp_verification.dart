// Flutter imports:
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/widgets/buttons/custom_buttons.dart';
import 'package:wegift/common/widgets/otp_input.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/src/app/router/routes.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';

// Project imports:

double _paddingInline = 20;
double _inputWidth = 60;

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key, required this.args}) : super(key: key);

  final OtpVerificationArgs args;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final List<String> otp = ["_", "_", "_", "_", "_", "_"];

  final GlobalKey<FormState> _formKey = GlobalKey();
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          leading: BackButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/signup'),
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: _paddingInline, top: 50),
                color: Colors.white,
                child: Text("Verification", style: context.textTheme.headline5),
                // const HeadingText(
                //   text: 'Verification',
                // ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: _paddingInline),
                child: const Text(
                    "Enter 6 digit verification code sent to your phone number"),
              ),
              Container(
                padding: EdgeInsets.only(top: 5, left: _paddingInline),
                child: Text(
                  widget.args.phoneNumber,
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: _paddingInline, right: _paddingInline, top: 50),
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: PinCodeTextField(
                      controller: otpController,
                      pinTheme: PinTheme(
                        inactiveColor: Colors.grey,
                        activeColor: Colors.blue,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                        borderWidth: 0.5,
                        inactiveFillColor: Colors.grey,
                        disabledColor: Colors.grey,
                      ),
                      appContext: context,
                      length: 6,
                      onChanged: (val) {},
                      inputFormatters: <TextInputFormatter>[
                        // for below version 2 use this
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),

                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    // OtpInput(
                    //   backAutoFocus: index != 0,
                    //   frontAutoFocus: index != 5,
                    //   onChanged: (val) {
                    //     log(val.toString());
                    //     setState(() {
                    //       if (val.isEmpty) {
                    //         otp[index] = "_";
                    //       } else {
                    //         otp[index] = val;
                    //       }
                    //     });
                    //   },
                    //   placeholder: '',
                    //   width: _inputWidth,
                    //   limit: 1,
                    // ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: RoundedButton(
                  text: 'Verify',
                  width: double.infinity,
                  paddingLeft: _paddingInline,
                  paddingRight: _paddingInline,
                  height: 40,
                  color: context.theme.colorScheme.primary,
                  textColor: Colors.white,
                  onPressed:
                      // otp.contains("_")
                      //     ? null
                      //     :
                      () {
                    context.read<AuthController>().verifyOtp(
                        widget.args.verificationId, otpController.text);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: _paddingInline, top: 35),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Didn't get code? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: "Resend",
                        style: TextStyle(
                          color: context.theme.colorScheme.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () async {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 25, left: _paddingInline, bottom: 60),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          color: context.theme.colorScheme.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            context.toNamed(AppRouter.onboarding);
                          },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class OtpVerificationArgs {
  final String phoneNumber;
  final String verificationId;

  OtpVerificationArgs(
      {required this.phoneNumber, required this.verificationId});
}
