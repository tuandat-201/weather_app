import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/models.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

part 'hourly_forecast_event.dart';
part 'hourly_forecast_state.dart';

class HourlyForecastBloc
    extends Bloc<HourlyForecastEvent, HourlyForecastState> {
  final WeatherRepositoryImpl repository;
  HourlyForecastBloc(this.repository) : super(HourlyForecastInitialState()) {
    on<HourlyForecastLoadingEvent>(_onHourlyForecastLoadingEvent);
  }

  Future<void> _onHourlyForecastLoadingEvent(
    HourlyForecastLoadingEvent event,
    Emitter<HourlyForecastState> emit,
  ) async {
    emit(HourlyForecastLoadingState());

    try {
      final hourlyForecast = await repository.getHourlyWeather();
      emit(HourlyForecastSuccessState(hourlyForecast: hourlyForecast));
    } catch (e) {
      emit(HourlyForecastFailedState());
    }
  }
}
