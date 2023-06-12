import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/helper.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';
import 'package:wegift/src/auth/widgets/signup/progress_buttons.dart';

class UsernameView extends StatelessWidget {
  UsernameView({super.key, required this.onNext, required this.state});

  final _usernameCon = TextEditingController();
  final VoidCallback onNext;
  final RegisterState state;

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FormHeader(text: "Create Username"),
          const SizedBox(height: 40),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Username is required";
              }
              return null;
            },
            controller: _usernameCon,
            decoration: Helper.getInputDecoration(label: "Username"),
          ),
          const SizedBox(height: 40),
          ProgressButtons(
            onNext: () async {
              final controller = context.read<AuthController>();
              if ((_formKey.currentState?.validate() ?? false)) {
                await controller.lookupUsername(_usernameCon.text, (state) {
                  state.when(
                    noUsername: () {
                      controller.model.username = _usernameCon.text;
                      onNext();
                      FocusScope.of(context).unfocus();
                    },
                    found: () {
                      context.showSnackbar(
                          "Username already exists. Choose a different username",
                          isError: true);
                    },
                    error: () {},
                  );
                });
              }
            },
            primaryButtonText: state.primaryButtonText,
            secondaryButtonText: state.secondaryButtonText,
          ),
        ],
      ),
    );
  }
}
