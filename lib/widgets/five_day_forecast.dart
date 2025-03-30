import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/widgets/widgets.dart';

class FiveDayForecast extends StatelessWidget {
  const FiveDayForecast({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final deviceSize = context.deviceSize;

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final fiveDayWeather = (state as WeatherSuccessState).fiveDayWeather;

        return Card(
          child: Container(
            width: deviceSize.width,
            height: deviceSize.height * 0.4,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.timelapse),
                    const Gap(5),
                    Text(
                      'Dự báo 5 ngày',
                      style: textTheme.titleMedium,
                    )
                  ],
                ),
                const Gap(5),
                Expanded(
                  child: ListView.separated(
                    itemCount: fiveDayWeather.length,
                    itemBuilder: (context, index) => FiveDayForecastTile(
                      weather: fiveDayWeather[index],
                      isNow: index == 0,
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
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
