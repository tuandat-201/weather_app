import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/data/model/models.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/utils/helper.dart';

class FiveDayForecastTile extends StatelessWidget {
  const FiveDayForecastTile({
    super.key,
    required this.weather,
    required this.isNow,
  });

  final WeatherOfDay weather;
  final bool isNow;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Container(
      decoration: BoxDecoration(
          color: isNow ? context.colorScheme.primaryContainer : null,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Helper.getWeatherIcon(weather.iconCode, true),
              height: 30,
              width: 30,
            ),
            const Gap(5),
            Text(
              Helper.convertDateToShorter(weather.date),
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        trailing: Text(
          '${weather.minTemperature.round()}° / ${weather.maxTemperature.round()}°',
          style: textTheme.bodyMedium,
        ),
        title: Text(weather.description),
      ),
    );
  }
}
