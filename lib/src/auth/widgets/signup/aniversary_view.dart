import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegift/common/helper.dart';
import 'package:wegift/common/widgets/date_dialogue_.dart';
import 'package:wegift/extensions/register_state.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/widgets/signup/form_header.dart';
import 'package:wegift/src/auth/widgets/signup/progress_buttons.dart';

class AnniversaryView extends StatefulWidget {
  const AnniversaryView({super.key, required this.onNext, required this.state});

  final VoidCallback onNext;
  final RegisterState state;

  @override
  State<AnniversaryView> createState() => _AniversaryViewState();
}

class _AniversaryViewState extends State<AnniversaryView> {
  final _aniCon = TextEditingController(text: "MM / DD / YY");
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FormHeader(text: "Do you have an Anniversary?"),
        const SizedBox(height: 40),
        TextFormField(
          readOnly: true,
          onTap: () async {
            final defaultDate = DateTime(2000);

            showCupertinoModalPopup(
              context: context,
              builder: (context) => buildBottomPicker(
                context,
                CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: date ?? defaultDate,
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      _aniCon.text = Helper.getFormattedDate(newDateTime);
                      date = newDateTime;
                    });
                  },
                ),
                centerTitle: "Anniversary",
                onDone: () {
                  if (date == null) {
                    setState(
                      () {
                        _aniCon.text = Helper.getFormattedDate(defaultDate);
                        date = defaultDate;
                      },
                    );
                  }
                },
              ),
            );
          },
          controller: _aniCon,
          style: TextStyle(color: Colors.grey.shade700),
          textAlign: TextAlign.center,
          decoration: Helper.getInputDecoration(),
        ),
        const SizedBox(height: 5),
        Text("Month , day , Year",
            style: TextStyle(color: Colors.grey.shade500)),
        const SizedBox(height: 40),
        Flexible(
          flex: 0,
          child: ProgressButtons(
            onNext: () {
              final controller = context.read<AuthController>();
              controller.model.anniversary = date;
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
