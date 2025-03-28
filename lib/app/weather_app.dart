import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/current_weather_bloc/current_weather_bloc.dart';
import 'package:weather_app/blocs/five_day_forecast_bloc/five_day_forecast_bloc.dart';
import 'package:weather_app/blocs/hourly_forecast_bloc/hourly_forecast_bloc.dart';
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  CurrentWeatherBloc(context.read<WeatherRepositoryImpl>())
                    ..add(CurrentWeatherLoadingEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  HourlyForecastBloc(context.read<WeatherRepositoryImpl>())
                    ..add(
                      HourlyForecastLoadingEvent(),
                    ),
            ),
            BlocProvider(
              create: (context) =>
                  FiveDayForecastBloc(context.read<WeatherRepositoryImpl>())
                    ..add(FiveDayForecastLoadingEvent()),
            )
          ],
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
