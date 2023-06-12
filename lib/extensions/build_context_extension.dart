import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Future<void> toNamed(String routeName, {Object? arguments}) async {
    await Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<void> off(String routeName, {Object? arguments}) async {
    await Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<void> offAll(String routeName,
      {Object? arguments, String? when}) async {
    await Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) {
      return route.settings.name != null && when != null
          ? route.settings.name != when
          : false;
    }, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();

  String? get currentRoute => ModalRoute.of(this)?.settings.name;

  Future<Object?> to(Widget child) async {
    return await Navigator.of(this)
        .push(MaterialPageRoute(builder: (context) => child));
  }

  void showSnackbar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.blue,
    ));
  }

  MaterialStateProperty<T> value<T>(T val) => MaterialStateProperty.all<T>(val);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
