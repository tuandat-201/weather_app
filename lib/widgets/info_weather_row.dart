import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/utils/extension.dart';

class InfoWeatherRow extends StatelessWidget {
  const InfoWeatherRow({
    super.key,
    required this.title,
    required this.info,
    required this.image,
    this.size,
    this.gap,
  });

  final String title;
  final String info;
  final String image;
  final double? size;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Row(
      children: [
        Image.asset(
          image,
          width: size ?? 50,
          height: size ?? 50,
        ),
        Gap(gap ?? 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyMedium,
            ),
            const Gap(1),
            Text(
              info,
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
