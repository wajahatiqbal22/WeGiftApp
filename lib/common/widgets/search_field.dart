import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField(
      {Key? key, required this.controller, this.onChanged, required this.isTextCentered})
      : super(key: key);
  final TextEditingController controller;
  final bool isTextCentered;
  final Function(String)? onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      textAlign: widget.isTextCentered ? TextAlign.center : TextAlign.start,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
          ),
          filled: true,
          // suffixIcon: ElevatedButton(
          //   style: ButtonStyle(backgroundColor: context.value(Colors.blueAccent)),
          //   child: const Text('GO'),
          //   onPressed: () {},
          // ),
          hintStyle: TextStyle(
            color: Colors.grey[800],
          ),
          hintText: "Search",
          fillColor: Colors.grey.shade200),
    );
  }
}
