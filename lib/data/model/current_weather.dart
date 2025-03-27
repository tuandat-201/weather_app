// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CurrentWeather {
  final String location;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final bool isDay;
  final String description;
  final int iconCode;
  final String sunrise;
  final String sunset;

  CurrentWeather({
    required this.location,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.isDay,
    required this.description,
    required this.iconCode,
    required this.sunrise,
    required this.sunset,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location,
      'temperature': temperature,
      'isDay': isDay,
      'description': description,
      'iconCode': iconCode,
    };
  }

  factory CurrentWeather.fromMap(Map<String, dynamic> map) {
    final forecast_day = map['forecast']['forecastday'][0];

    final minTemperature = forecast_day['day']['mintemp_c'] as double;
    final maxTemperature = forecast_day['day']['maxtemp_c'] as double;
    final sunrise = forecast_day['astro']['sunrise'] as String;
    final sunset = forecast_day['astro']['sunset'] as String;

    return CurrentWeather(
      location: map['location']['name'] as String,
      temperature: map['current']['temp_c'] as double,
      minTemperature: minTemperature,
      maxTemperature: maxTemperature,
      isDay: map['current']['is_day'] as int == 1 ? true : false,
      description: map['current']['condition']['text'] as String,
      iconCode: map['current']['condition']['code'] as int,
      sunrise: sunrise,
      sunset: sunset,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CurrentWeather(location: $location, temperature: $temperature, minTemperature: $minTemperature, maxTemperature: $maxTemperature, isDay: $isDay, description: $description, iconCode: $iconCode, sunrise: $sunrise, sunset: $sunset)';
  }
}
