import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is WeatherFailedState) {
          return const Scaffold(
            body: Center(
              child: Text('Có lỗi xảy ra'),
            ),
          );
        }

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
                  MainWeatherInfo(),
                  Gap(10),
                  SubWeatherInfo(),
                  Gap(10),
                  HourlyForecast(),
                  Gap(10),
                  FiveDayForecast(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
