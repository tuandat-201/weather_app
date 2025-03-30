part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitialState extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  final CurrentWeather currentWeather;
  final List<HourlyWeather> hourlyForecast;
  final List<WeatherOfDay> fiveDayWeather;

  const WeatherSuccessState({
    required this.currentWeather,
    required this.hourlyForecast,
    required this.fiveDayWeather,
  });

  @override
  List<Object> get props => [currentWeather, hourlyForecast, fiveDayWeather];
}

final class WeatherFailedState extends WeatherState {}
