import 'package:flutter/material.dart';

extension Navigatons on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveAll(String routeName, {Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, arguments: arguments, (route) => false);
  }

  void pop() => Navigator.pop(this);
}
