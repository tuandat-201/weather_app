import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/data/model/models.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/utils/helper.dart';

class HourlyForecastTile extends StatelessWidget {
  const HourlyForecastTile({
    super.key,
    required this.hourlyWeather,
    required this.isNow,
  });

  final HourlyWeather hourlyWeather;
  final bool isNow;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final deviceSize = context.deviceSize;

    return Card(
      color: isNow ? context.colorScheme.primaryContainer : null,
      child: Container(
        width: deviceSize.width * 0.4,
        child: Row(
          children: [
            Image.asset(
              Helper.getWeatherIcon(
                  hourlyWeather.iconCode, hourlyWeather.isDay),
              height: 50,
            ),
            const Gap(15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isNow == true
                      ? 'Hiện tại'
                      : Helper.convertDateTo24HourTime(hourlyWeather.time),
                  style: textTheme.bodyMedium,
                ),
                Text(
                  '${hourlyWeather.temperature.round()}°C',
                  style: textTheme.bodyLarge,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
