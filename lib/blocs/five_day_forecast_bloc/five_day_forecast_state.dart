part of 'five_day_forecast_bloc.dart';

sealed class FiveDayForecastState extends Equatable {
  const FiveDayForecastState();

  @override
  List<Object> get props => [];
}

final class FiveDayForecastInitialState extends FiveDayForecastState {}

final class FiveDayForecastLoadingState extends FiveDayForecastState {}

final class FiveDayForecastSuccessState extends FiveDayForecastState {
  final List<WeatherOfDay> fiveDayWeather;

  const FiveDayForecastSuccessState({required this.fiveDayWeather});

  @override
  List<Object> get props => [fiveDayWeather];
}

final class FiveDayForecastFailedState extends FiveDayForecastState {}
