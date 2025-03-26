import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/utils/extension.dart';

class FiveDayForecastTile extends StatelessWidget {
  const FiveDayForecastTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/assets/sun.png',
            height: 30,
            width: 30,
          ),
          const Gap(5),
          Text(
            'Hôm nay',
            style: textTheme.bodyMedium,
          ),
        ],
      ),
      trailing: Text(
        '12° / 21°',
        style: textTheme.bodyMedium,
      ),
      title: const Text('Trời nhiều mây'),
    );
  }
}
