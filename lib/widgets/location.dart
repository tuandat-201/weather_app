import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/current_weather_bloc/current_weather_bloc.dart';
import 'package:weather_app/utils/extension.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        late Widget content;

        if (state is CurrentWeatherInitialState ||
            state is CurrentWeatherLoadingState) {
          content = const Center(child: CircularProgressIndicator());
        } else if (state is CurrentWeatherFailedState) {
          content = Center(
            child: Text(
              'Có lỗi xảy ra',
              style: textTheme.titleLarge,
            ),
          );
        } else {
          final currentWeather = (state as CurrentWeatherSuccessState).weather;

          print(currentWeather);

          content = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on),
              Text(
                currentWeather.location,
                style: textTheme.titleLarge,
              ),
            ],
          );
        }

        return content;
      },
    );
  }
}
