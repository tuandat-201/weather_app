import 'dart:convert';

import 'package:weather_app/utils/current_location.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/model/models.dart';
import 'package:weather_app/utils/helper.dart';

class WeatherDataProvider {
  WeatherDataProvider._();

  static const String _baseUrl = "https://api.weatherapi.com/v1/forecast.json";
  static const String _apiKey = "830e07a3d18c4065970130104252203";
  static String? _currentLocation;
  static Map<String, dynamic>? _rawData;

  static Future<void> _fetchLocation() async {
    if (_currentLocation == null) {
      try {
        final location = await getCurrentLocation();
        _currentLocation = "${location.latitude},${location.longitude}";
      } catch (e) {
        throw Exception("Không thể lấy vị trí: $e");
      }
    }
  }

  static Future<void> _fetchData() async {
    await _fetchLocation();
    if (_currentLocation == null) {
      throw Exception("Vị trí chưa được xác định.");
    }

    final url =
        Uri.parse('$_baseUrl?q=$_currentLocation&days=5&key=$_apiKey&lang=vi');

    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception("Lỗi khi lấy dữ liệu từ API: ${response.body}");
      }
      _rawData = json.decode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw Exception("Lỗi kết nối API: $e");
    }
  }

  static Future<CurrentWeather> getCurrentWeather() async {
    if (_rawData == null) {
      await _fetchData();
    }
    return CurrentWeather.fromMap(_rawData!);
  }

  static Future<List<HourlyWeather>> getHourlyWeather() async {
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

  static Future<List<WeatherOfDay>> getFiveDayWeather() async {
    if (_rawData == null) {
      await _fetchData();
    }

    final listForecast = _rawData!['forecast']['forecastday'] as List<dynamic>;

    return listForecast
        .map((forecast) => WeatherOfDay.fromMap(forecast))
        .toList();
  }
}
