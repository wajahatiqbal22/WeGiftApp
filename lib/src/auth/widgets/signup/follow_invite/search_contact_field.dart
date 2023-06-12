import 'package:flutter/material.dart';
import 'package:wegift/common/helper.dart';

class SearchContactField extends StatelessWidget {
  const SearchContactField({
    Key? key,
    this.onChanged,
  }) : super(key: key);
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onChanged: onChanged,
        decoration: Helper.getInputDecoration(
          label: "Search",
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
