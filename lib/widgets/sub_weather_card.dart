import 'package:flutter/material.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/widgets/widgets.dart';

class SubWeatherCard extends StatelessWidget {
  const SubWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Container(
            width: deviceSize.width * 0.45,
            height: deviceSize.height * 0.15,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoWeatherRow(
                  title: 'Nhiệt độ cao nhất',
                  info: '21°C',
                  image: 'lib/assets/warm.png',
                  size: 35,
                  gap: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                InfoWeatherRow(
                  title: 'Nhiệt độ thấp nhất',
                  info: '12°C',
                  image: 'lib/assets/cold.png',
                  size: 35,
                  gap: 5,
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            width: deviceSize.width * 0.45,
            height: deviceSize.height * 0.15,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoWeatherRow(
                  title: 'Bình Minh',
                  image: 'lib/assets/sunrise.png',
                  info: '05:30',
                ),
                Divider(
                  thickness: 1,
                ),
                InfoWeatherRow(
                  title: 'Hoàng Hôn',
                  image: 'lib/assets/sunset.png',
                  info: '17:30',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
