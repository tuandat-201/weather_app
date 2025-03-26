import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/widgets/five_day_forecast.dart';
import 'package:weather_app/widgets/hourly_forecast.dart';
import 'package:weather_app/widgets/location.dart';
import 'package:weather_app/widgets/main_weather_card.dart';
import 'package:weather_app/widgets/sub_weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Location(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              MainWeatherCard(),
              Gap(10),
              SubWeatherCard(),
              Gap(10),
              HourlyForecast(),
              Gap(10),
              FiveDayForecast(),
            ],
          ),
        ),
      ),
    );
  }
}
