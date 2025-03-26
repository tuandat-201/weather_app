import 'package:flutter/material.dart';
import 'package:weather_app/utils/extension.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on),
        Text(
          'Hà Nội',
          style: textTheme.titleLarge,
        ),
      ],
    );
  }
}
