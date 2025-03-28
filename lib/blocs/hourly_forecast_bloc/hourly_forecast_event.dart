part of 'hourly_forecast_bloc.dart';

sealed class HourlyForecastEvent extends Equatable {
  const HourlyForecastEvent();

  @override
  List<Object> get props => [];
}

final class HourlyForecastLoadingEvent extends HourlyForecastEvent {}
