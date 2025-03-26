import 'package:flutter/material.dart';
import 'package:weather_app/configs/config.dart';
import 'package:weather_app/screens/screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
