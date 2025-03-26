import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/utils/extension.dart';

class HourlyForecastTile extends StatelessWidget {
  const HourlyForecastTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final deviceSize = context.deviceSize;

    return Card(
      child: Container(
        width: deviceSize.width * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/sun.png',
              height: 50,
            ),
            const Gap(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hiện tại',
                  style: textTheme.bodyMedium,
                ),
                Text(
                  '21°C',
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
