part of 'hourly_forecast_bloc.dart';

sealed class HourlyForecastState extends Equatable {
  const HourlyForecastState();

  @override
  List<Object> get props => [];
}

final class HourlyForecastInitialState extends HourlyForecastState {}

final class HourlyForecastLoadingState extends HourlyForecastState {}

final class HourlyForecastSuccessState extends HourlyForecastState {
  final List<HourlyWeather> hourlyForecast;

  const HourlyForecastSuccessState({required this.hourlyForecast});

  @override
  List<Object> get props => [hourlyForecast];
}

final class HourlyForecastFailedState extends HourlyForecastState {}
