import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/widgets/widgets.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final deviceSize = context.deviceSize;

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final hourlyForecast = (state as WeatherSuccessState).hourlyForecast;

        return Card(
          child: Container(
            width: deviceSize.width,
            height: deviceSize.height * 0.15,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.timelapse),
                    const Gap(5),
                    Text(
                      'Dự báo 24 giờ',
                      style: textTheme.titleMedium,
                    )
                  ],
                ),
                const Gap(5),
                SizedBox(
                  height: deviceSize.height * 0.1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hourlyForecast.length,
                    itemBuilder: (context, index) => HourlyForecastTile(
                      hourlyWeather: hourlyForecast[index],
                      isNow: index == 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
