// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/data/data_source/weather_data_provider.dart';
import 'package:weather_app/data/model/models.dart';
import 'package:weather_app/utils/helper.dart';

abstract class WeatherRepository {
  Future<CurrentWeather> getCurrentWeather();
  Future<List<HourlyWeather>> getHourlyWeather();
  Future<List<WeatherOfDay>> getFiveDayWeather();
}

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataProvider _dataProvider;
  Map<String, dynamic>? _rawData;

  WeatherRepositoryImpl(this._dataProvider);

  Future<void> _loadData() async {
    _rawData ??= await _dataProvider.fetchData();
  }

  @override
  Future<CurrentWeather> getCurrentWeather() async {
    await _loadData();
    return CurrentWeather.fromMap(_rawData!);
  }

  @override
  Future<List<HourlyWeather>> getHourlyWeather() async {
    await _loadData();

    final currentWeather = await getCurrentWeather();
    final List<HourlyWeather> hourlyWeatherList = [
      HourlyWeather.fromCurrentWeather(currentWeather)
    ];

    final listForecast = _rawData!['forecast']['forecastday'] as List<dynamic>;

    for (var forecast in listForecast) {
      for (var hourForecast in forecast['hour']) {
        DateTime time = Helper.stringToDateTime(hourForecast['time'] as String);

        if (time.isAfter(DateTime.now())) {
          hourlyWeatherList.add(HourlyWeather.fromMap(hourForecast));
          if (hourlyWeatherList.length == 24) {
            return hourlyWeatherList;
          }
        }
      }
    }

    return hourlyWeatherList;
  }

  @override
  Future<List<WeatherOfDay>> getFiveDayWeather() async {
    await _loadData();

    final listForecast = _rawData!['forecast']['forecastday'] as List<dynamic>;

    return listForecast
        .map((forecast) => WeatherOfDay.fromMap(forecast))
        .toList();
  }
}
