import 'package:weather_app/data/model/current_weather.dart';
import 'package:weather_app/utils/helper.dart';

class HourlyWeather {
  final String time;
  final double temperature;
  final bool isDay;
  final int iconCode;

  HourlyWeather({
    required this.time,
    required this.temperature,
    required this.isDay,
    required this.iconCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'temperature': temperature,
      'isDay': isDay,
      'iconCode': iconCode,
    };
  }

  factory HourlyWeather.fromMap(Map<String, dynamic> map) {
    return HourlyWeather(
      time: map['time'] as String,
      temperature: map['temp_c'] as double,
      isDay: map['is_day'] as int == 1 ? true : false,
      iconCode: map['condition']['code'] as int,
    );
  }

  factory HourlyWeather.fromCurrentWeather(CurrentWeather currentWeather) {
    return HourlyWeather(
        time: Helper.dateTimeToString(DateTime.now()),
        temperature: currentWeather.temperature,
        isDay: currentWeather.isDay,
        iconCode: currentWeather.iconCode);
  }

  @override
  String toString() {
    return 'HourlyWeather(time: $time, temperature: $temperature, isDay: $isDay, iconCode: $iconCode)';
  }
}
