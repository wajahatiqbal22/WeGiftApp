import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wegift/extensions/build_context_extension.dart';

Widget buildBottomPicker(BuildContext context, Widget picker,
    {String? centerTitle, Function()? onDone}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        // height: context.height * 0.4,
        padding: const EdgeInsets.only(top: 6.0),
        color: CupertinoColors.white,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: CupertinoColors.black,
            fontSize: 22.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.grey.shade300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    centerTitle != null ? Text(centerTitle) : const SizedBox(),
                    TextButton(
                      onPressed: () {},
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onDone?.call();
                        },
                        child: const Text("Done"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.36,
                child: GestureDetector(
                  onTap: () {},
                  child: SafeArea(
                    top: false,
                    child: picker,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
