import 'package:flutter/material.dart';

class ListenerBuilder extends StatefulWidget {
  /// Creates a widget that delegates a function to call functions inside the widget tree
  ///
  /// The [listener] argument must not be null.
  const ListenerBuilder({super.key, required this.listener, this.child});
  final Listener listener;
  final Widget? child;

  @override
  State<ListenerBuilder> createState() => _ListenerBuilderState();
}

class _ListenerBuilderState extends State<ListenerBuilder> {
  @override
  void initState() {
    widget.listener(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

typedef Listener = void Function(BuildContext context);
