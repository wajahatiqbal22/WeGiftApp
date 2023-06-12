import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wegift/extensions/build_context_extension.dart';

class ProfileSettingTiles extends StatelessWidget {
  const ProfileSettingTiles(
      {Key? key,
      required this.label,
      required this.hintText,
      this.controller,
      this.onTap,
      this.isRemovable = false,
      this.onChanged,
      this.masks = const [],
      this.validator,
      this.isEnabled = true})
      : super(key: key);
  final String label;
  final String? hintText;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  final bool isEnabled;
  final String? Function(String?)? validator;
  final List<MaskTextInputFormatter> masks;
  final bool isRemovable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 10,
      ),
      child: Row(
        children: [
          SizedBox(
            width: context.width * 0.4,
            child: Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: StatefulBuilder(builder: (context, setState) {
              return TextFormField(
                enabled: isEnabled,
                onChanged: onChanged,
                onTap: onTap,
                controller: controller,
                validator: validator,
                style: !isEnabled ? const TextStyle(color: Colors.grey) : null,
                inputFormatters: masks,
                decoration: InputDecoration(
                  hintText: hintText ?? "",
                  suffixIcon: !isEnabled
                      ? IconButton(
                          icon: const Icon(Icons.error),
                          onPressed: () {},
                          tooltip: "Cannot be changed.",
                        )
                      : isRemovable && (controller?.text.isNotEmpty ?? false)
                          ? IconButton(
                              onPressed: () {
                                controller?.clear();
                                setState(() {});
                              },
                              icon: const Icon(Icons.cancel))
                          : null,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
