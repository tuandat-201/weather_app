import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/utils/helper.dart';
import 'package:weather_app/widgets/widgets.dart';

class SubWeatherInfo extends StatelessWidget {
  const SubWeatherInfo({super.key});

  Widget _buildMaxMinTemp(WeatherState state) {
    final weather = (state as WeatherSuccessState).currentWeather;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoWeatherRow(
          title: 'Nhiệt độ cao nhất',
          info: '${weather.maxTemperature.round()}°C',
          image: 'lib/assets/warm.png',
          size: 35,
          gap: 5,
        ),
        const Divider(
          thickness: 1,
        ),
        InfoWeatherRow(
          title: 'Nhiệt độ thấp nhất',
          info: '${weather.minTemperature.round()}°C',
          image: 'lib/assets/cold.png',
          size: 35,
          gap: 5,
        ),
      ],
    );
  }

  Widget _buildSunriseAndSunset(WeatherState state) {
    final weather = (state as WeatherSuccessState).currentWeather;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoWeatherRow(
          title: 'Bình Minh',
          image: 'lib/assets/sunrise.png',
          info: Helper.convertTimeTo24HourTime(weather.sunrise),
        ),
        const Divider(
          thickness: 1,
        ),
        InfoWeatherRow(
          title: 'Hoàng Hôn',
          image: 'lib/assets/sunset.png',
          info: Helper.convertTimeTo24HourTime(weather.sunset),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                width: deviceSize.width * 0.45,
                height: deviceSize.height * 0.15,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: _buildMaxMinTemp(state),
              ),
            ),
            Card(
              child: Container(
                width: deviceSize.width * 0.45,
                height: deviceSize.height * 0.15,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: _buildSunriseAndSunset(state),
              ),
            ),
          ],
        );
      },
    );
  }
}
