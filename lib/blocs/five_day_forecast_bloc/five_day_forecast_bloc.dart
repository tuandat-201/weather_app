import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/models.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

part 'five_day_forecast_event.dart';
part 'five_day_forecast_state.dart';

class FiveDayForecastBloc
    extends Bloc<FiveDayForecastEvent, FiveDayForecastState> {
  final WeatherRepositoryImpl repository;
  FiveDayForecastBloc(this.repository) : super(FiveDayForecastInitialState()) {
    on<FiveDayForecastLoadingEvent>(_onFiveDayForecastLoadingEvent);
  }

  Future<void> _onFiveDayForecastLoadingEvent(
    FiveDayForecastLoadingEvent event,
    Emitter<FiveDayForecastState> emit,
  ) async {
    emit(FiveDayForecastLoadingState());

    try {
      final fiveDayWeather = await repository.getFiveDayWeather();
      emit(FiveDayForecastSuccessState(fiveDayWeather: fiveDayWeather));
    } catch (e) {
      emit(FiveDayForecastFailedState());
    }
  }
}
