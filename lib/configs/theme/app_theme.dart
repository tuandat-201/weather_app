import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 226, 232, 212),
      brightness: Brightness.light);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.nunitoTextTheme(),
  );
}
