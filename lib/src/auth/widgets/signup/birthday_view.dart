import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/helper.dart';
import 'package:wegift/common/widgets/date_dialogue_.dart';
import 'package:wegift/extensions/build_context_extension.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';
import 'package:wegift/src/auth/widgets/signup/progress_buttons.dart';

class BirthdayView extends StatefulWidget {
  const BirthdayView({super.key, required this.onNext, required this.state});

  final VoidCallback onNext;
  final RegisterState state;

  @override
  State<BirthdayView> createState() => _BirthdayViewState();
}

class _BirthdayViewState extends State<BirthdayView> {
  final _birthCon = TextEditingController(text: "MM / DD / YY");
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FormHeader(text: "Help friends celebrate your birthday!"),
        const SizedBox(height: 40),
        Builder(builder: (context) {
          final selectedBD = context.select<AuthController, DateTime?>(
              (value) => value.getSelectedBirthday);

          return TextFormField(
            readOnly: true,
            onTap: () async {
              final defaultDate = DateTime.parse('1990-01-01');

              await showCupertinoModalPopup(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return buildBottomPicker(
                    context,
                    CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: date ?? defaultDate,
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          _birthCon.text = Helper.getFormattedDate(newDateTime);
                          date = newDateTime;
                        });
                      },
                    ),
                    centerTitle: "Birthday",
                    onDone: () {
                      if (date == null) {
                        setState(
                          () {
                            _birthCon.text =
                                Helper.getFormattedDate(defaultDate);
                            date = defaultDate;
                          },
                        );
                      }
                    },
                  );
                },
              );
            },
            controller: _birthCon,
            style: TextStyle(color: Colors.grey.shade700),
            textAlign: TextAlign.center,
            decoration: Helper.getInputDecoration(),
          );
        }),
        const SizedBox(height: 5),
        Text("Month , Day , Year",
            style: TextStyle(color: Colors.grey.shade500)),
        const SizedBox(height: 40),
        Flexible(
          flex: 0,
          child: ProgressButtons(
            isEnabled: date != null,
            onNext: () {
              if ((DateTime.now().year - date!.year) < 17) {
                context.showSnackbar("You must be atleast 17 years old!",
                    isError: true);
                return;
              }
              final controller = context.read<AuthController>();
              controller.model.birthday = date;
              widget.onNext();
              FocusScope.of(context).unfocus();
            },
            primaryButtonText: widget.state.primaryButtonText,
            secondaryButtonText: widget.state.secondaryButtonText,
          ),
        ),
      ],
    );
  }
}
