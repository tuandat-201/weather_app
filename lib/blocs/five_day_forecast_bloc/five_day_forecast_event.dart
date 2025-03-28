part of 'five_day_forecast_bloc.dart';

sealed class FiveDayForecastEvent extends Equatable {
  const FiveDayForecastEvent();

  @override
  List<Object> get props => [];
}

final class FiveDayForecastLoadingEvent extends FiveDayForecastEvent {}
