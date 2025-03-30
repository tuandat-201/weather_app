import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/utils/extension.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final currentWeather = (state as WeatherSuccessState).currentWeather;

        print(currentWeather);

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on),
            Text(
              currentWeather.location,
              style: textTheme.titleLarge,
            ),
          ],
        );
      },
    );
  }
}
