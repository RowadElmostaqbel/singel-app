import 'package:flutter/material.dart';

extension SizeHelper on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension NavigationHelper on BuildContext {
  Future<T?> navigateTo<T>(Widget widget) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget));

  Future<T?> navigateToReplacement<T>(Widget widget) => Navigator.of(this)
      .pushReplacement(MaterialPageRoute(builder: (context) => widget));

  pop() => Navigator.of(this).pop();
}

extension StringHelper on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
