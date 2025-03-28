import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/current_weather_bloc/current_weather_bloc.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/utils/helper.dart';
import 'package:weather_app/widgets/widgets.dart';

class SubWeatherInfo extends StatelessWidget {
  const SubWeatherInfo({super.key});

  Widget _buildMaxMinTemp(CurrentWeatherState state) {
    if (state is CurrentWeatherInitialState ||
        state is CurrentWeatherLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is CurrentWeatherSuccessState) {
      final weather = state.weather;

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
    return const Center(child: Text('Có lỗi xảy ra'));
  }

  Widget _buildSunriseAndSunset(CurrentWeatherState state) {
    if (state is CurrentWeatherInitialState ||
        state is CurrentWeatherLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is CurrentWeatherSuccessState) {
      final weather = state.weather;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoWeatherRow(
            title: 'Bình Minh',
            image: 'lib/assets/sunrise.png',
            info: '${Helper.convertTimeTo24HourTime(weather.sunrise)}',
          ),
          const Divider(
            thickness: 1,
          ),
          InfoWeatherRow(
            title: 'Hoàng Hôn',
            image: 'lib/assets/sunset.png',
            info: '${Helper.convertTimeTo24HourTime(weather.sunset)}',
          ),
        ],
      );
    }
    return const Center(child: Text('Có lỗi xảy ra'));
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
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
