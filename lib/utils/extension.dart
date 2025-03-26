import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get _themeData => Theme.of(this);
  ColorScheme get colorScheme => _themeData.colorScheme;
  TextTheme get textTheme => _themeData.textTheme;
  Size get deviceSize => MediaQuery.of(this).size;
}
