import 'package:flutter/material.dart';

extension AppNavigation on BuildContext {
  /// Push a named route onto the navigator using the [path] and optional [arguments]
  Future<T?> push<T>(String path, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(path, arguments: arguments);
  }

  /// Replace the current route of the navigator by pushing the route named [path] and then disposing the previous route once the new route has finished animating in
  Future<T?> off<T, TO>(String path, {Object? arguments, TO? result}) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(path, arguments: arguments);
  }

  /// Push the route with the given [path] onto the navigator, and then remove all the previous routes
  Future<T?> offAll<T>(String path, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(path, (route) => false, arguments: arguments);
  }

  /// Pop the top-most route off the navigator
  void pop<T>({T? result}) {
    Navigator.of(this).pop(result);
  }
}
