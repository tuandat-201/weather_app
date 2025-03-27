class WeatherOfDay {
  final String date;
  final double minTemperature;
  final double maxTemperature;
  final String description;
  final int iconCode;

  WeatherOfDay({
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.description,
    required this.iconCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'minTemperature': minTemperature,
      'maxTemperature': maxTemperature,
      'description': description,
      'iconCode': iconCode,
    };
  }

  factory WeatherOfDay.fromMap(Map<String, dynamic> map) {
    return WeatherOfDay(
      date: map['date'] as String,
      minTemperature: map['day']['mintemp_c'] as double,
      maxTemperature: map['day']['maxtemp_c'] as double,
      description: map['day']['condition']['text'] as String,
      iconCode: map['day']['condition']['code'] as int,
    );
  }

  @override
  String toString() {
    return 'WeatherOfDay(date: $date,minTemperature: $minTemperature, maxTemperature: $maxTemperature, description: $description, iconCode: $iconCode)';
  }
}
