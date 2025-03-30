import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/models.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositoryImpl repository;
  WeatherBloc(this.repository) : super(WeatherInitialState()) {
    on<WeatherLoadingEvent>(_onWeatherLoadingEvent);
  }

  Future<void> _onWeatherLoadingEvent(
    WeatherLoadingEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoadingState());

    try {
      await repository.loadData();
      final currentWeather = await repository.getCurrentWeather();
      final hourlyForecast = await repository.getHourlyWeather();
      final fiveDayWeather = await repository.getFiveDayWeather();

      emit(
        WeatherSuccessState(
            currentWeather: currentWeather,
            hourlyForecast: hourlyForecast,
            fiveDayWeather: fiveDayWeather),
      );
    } catch (e) {
      emit(WeatherFailedState());
    }
  }
}
