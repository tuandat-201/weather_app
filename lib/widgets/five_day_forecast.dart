import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/widgets/five_day_forecast_tile.dart';

class FiveDayForecast extends StatelessWidget {
  const FiveDayForecast({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final deviceSize = context.deviceSize;

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
                itemCount: 5,
                itemBuilder: (context, index) => const FiveDayForecastTile(),
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
