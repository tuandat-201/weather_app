import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/blocs/five_day_forecast_bloc/five_day_forecast_bloc.dart';
import 'package:weather_app/utils/extension.dart';
import 'package:weather_app/widgets/widgets.dart';

class FiveDayForecast extends StatelessWidget {
  const FiveDayForecast({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final deviceSize = context.deviceSize;

    return BlocBuilder<FiveDayForecastBloc, FiveDayForecastState>(
      builder: (context, state) {
        late Widget content;

        if (state is FiveDayForecastInitialState ||
            state is FiveDayForecastLoadingState) {
          content =
              const Expanded(child: Center(child: CircularProgressIndicator()));
        } else if (state is FiveDayForecastFailedState) {
          content = Center(
            child: Text(
              'Có lỗi xảy ra',
              style: textTheme.titleLarge,
            ),
          );
        } else {
          final fiveDayForecast =
              (state as FiveDayForecastSuccessState).fiveDayWeather;

          content = Expanded(
            child: ListView.separated(
              itemCount: fiveDayForecast.length,
              itemBuilder: (context, index) => FiveDayForecastTile(
                weather: fiveDayForecast[index],
                isNow: index == 0,
              ),
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
              ),
            ),
          );
        }

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
                content,
              ],
            ),
          ),
        );
      },
    );
  }
}
