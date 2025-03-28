import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/models.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final WeatherRepositoryImpl repository;

  CurrentWeatherBloc(this.repository) : super(CurrentWeatherInitialState()) {
    on<CurrentWeatherLoadingEvent>(_onCurrentWeatherLoadingEvent);
  }

  Future<void> _onCurrentWeatherLoadingEvent(
    CurrentWeatherLoadingEvent event,
    Emitter<CurrentWeatherState> emit,
  ) async {
    emit(CurrentWeatherLoadingState());

    try {
      final currentWeather = await repository.getCurrentWeather();
      emit(CurrentWeatherSuccessState(weather: currentWeather));
    } catch (e) {
      emit(CurrentWeatherFailedState());
    }
  }
}
