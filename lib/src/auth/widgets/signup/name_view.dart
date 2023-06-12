import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/helper.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';
import 'package:wegift/src/auth/widgets/signup/progress_buttons.dart';

class NameView extends StatefulWidget {
  NameView({super.key, required this.state, required this.onNext});

  final RegisterState state;
  final VoidCallback onNext;

  @override
  State<NameView> createState() => _NameViewState();
}

class _NameViewState extends State<NameView> {
  late final _formKey = GlobalKey<FormState>();

  late final _firstNameCon = TextEditingController();

  late final _lastNameCon = TextEditingController();

  late final _emailCon = TextEditingController();

  late final _phone = TextEditingController();

  PhoneNumber phone = PhoneNumber(isoCode: "US");

  @override
  void initState() {
    final WeGiftUser user = context.read<AuthController>().wegiftUser;
    _firstNameCon.text = user.firstName;
    _lastNameCon.text = user.lastName;
    _emailCon.text = user.email;
    _phone.text = user.phoneNumber ?? "";
    final model = context.read<AuthController>().model;
    if (model.isoCode != null && model.phoneNumber != null) {
      phone =
          PhoneNumber(isoCode: model.isoCode, phoneNumber: model.phoneNumber);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.01),
            const FormHeader(
              text: "What's Your Name?",
            ),
            const SizedBox(height: 40),
            TextFormField(
              validator: (value) =>
                  value!.isEmpty ? "Field is mandatory" : null,
              controller: _firstNameCon,
              decoration: Helper.getInputDecoration(label: "First Name"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              validator: (value) =>
                  value!.isEmpty ? "Field is mandatory" : null,
              controller: _lastNameCon,
              decoration: Helper.getInputDecoration(label: "Last Name"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              validator: (value) =>
                  value!.isEmpty ? "Field is mandatory" : null,
              controller: _emailCon,
              decoration: Helper.getInputDecoration(label: "Email"),
            ),
            const SizedBox(height: 20),
            Builder(builder: (context) {
              return InternationalPhoneNumberInput(
                formatInput: false,
                validator: (v) {
                  final regex = RegExp(
                      r"\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$");
                  // if (!regex.hasMatch(_phone.text)) {
                  //   return "Invalid phone number.";
                  // }
                  if (_phone.text.length < 11) {
                    return "Invalid phone number";
                  }
                  return null;
                },
                initialValue: phone,
                ignoreBlank: true,
                onInputChanged: (phoneNumber) {
                  // log(phone.isoCode.toString());
                  _phone.text = phoneNumber.phoneNumber ?? "";
                  phone = phoneNumber;
                },
                maxLength: 15,
                selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
              );
            }),
            // TextFormField(
            //   validator: (v) {
            //     final regex = RegExp(
            //         r"\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$");

            //     if (!regex.hasMatch(v!)) {
            //       return "Invalid phone number.";
            //     }
            //     return null;
            //   },
            //   controller: _phone,
            //   decoration: Helper.getInputDecoration(
            //     label: "Phone",
            //     hintText: '+10000000000',
            //   ),
            // ),
            const SizedBox(height: 20),
            Center(
              child: ProgressButtons(
                onNext: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final controller = context.read<AuthController>();
                    controller.model.setDetails(
                      phoneNumber: _phone.text,
                      email: _emailCon.text,
                      firstName: _firstNameCon.text,
                      lastName: _lastNameCon.text,
                      isoCode: phone.isoCode!,
                    );
                    widget.onNext();
                    FocusScope.of(context).unfocus();
                  }
                },
                primaryButtonText: widget.state.primaryButtonText,
                secondaryButtonText: widget.state.secondaryButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
