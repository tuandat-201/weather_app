import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/utils/helper.dart';

class MainWeatherInfo extends StatelessWidget {
  const MainWeatherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final textTheme = context.textTheme;

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final currentWeather = (state as WeatherSuccessState).currentWeather;

        return Card(
          child: Container(
            width: deviceSize.width,
            height: deviceSize.height * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Helper.getWeatherIcon(
                      currentWeather.iconCode, currentWeather.isDay),
                  height: deviceSize.height * 0.15,
                  fit: BoxFit.cover,
                ),
                const Gap(20),
                Text(
                  '${currentWeather.temperature.round()}°C',
                  style: textTheme.titleLarge!.copyWith(
                    fontSize: 48,
                  ),
                ),
                const Gap(10),
                Text(
                  '${currentWeather.description}',
                  // textAlign: TextAlign.center,
                  style: textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
