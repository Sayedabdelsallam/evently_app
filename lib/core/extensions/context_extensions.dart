import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  void back({Object? arguments}) => Navigator.of(this).pop(arguments);

  void goToNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  void goToNamedReplace(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  void goBackUntil(
    String routeName,
  ) =>
      Navigator.of(this).popUntil((route) => route.settings.name == routeName);

  void goBackUntilAndPush(String untilRouteName, String pushRouteName,
          {Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        pushRouteName,
        (route) => route.settings.name == untilRouteName,
        arguments: arguments,
      );
}

