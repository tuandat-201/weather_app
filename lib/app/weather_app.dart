import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/configs/config.dart';
import 'package:weather_app/data/data_source/weather_data_provider.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/screens/screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = WeatherDataProvider();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: RepositoryProvider(
        create: (context) => WeatherRepositoryImpl(dataProvider),
        child: BlocProvider(
          create: (context) =>
              WeatherBloc(context.read<WeatherRepositoryImpl>())
                ..add(WeatherLoadingEvent()),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
