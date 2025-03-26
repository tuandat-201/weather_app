import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/utils/extension.dart';

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final textTheme = context.textTheme;

    return Card(
      child: Container(
        width: deviceSize.width,
        height: deviceSize.height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/sun.png',
              height: deviceSize.height * 0.15,
              fit: BoxFit.cover,
            ),
            const Gap(20),
            Text(
              '21°C',
              style: textTheme.titleLarge!.copyWith(
                fontSize: 48,
              ),
            ),
            const Gap(10),
            Text(
              'Mưa rơi nặng hạt, có thể xảy ra giống lốc',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge!.copyWith(
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
