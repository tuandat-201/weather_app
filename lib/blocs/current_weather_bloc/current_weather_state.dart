part of 'current_weather_bloc.dart';

sealed class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object> get props => [];
}

final class CurrentWeatherInitialState extends CurrentWeatherState {}

final class CurrentWeatherLoadingState extends CurrentWeatherState {}

final class CurrentWeatherSuccessState extends CurrentWeatherState {
  final CurrentWeather weather;

  const CurrentWeatherSuccessState({required this.weather});

  @override
  List<Object> get props => [weather];
}

final class CurrentWeatherFailedState extends CurrentWeatherState {}
