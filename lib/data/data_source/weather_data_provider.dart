import 'dart:convert';

import 'package:weather_app/utils/current_location.dart';
import 'package:http/http.dart' as http;

class WeatherDataProvider {
  static const String _baseUrl = "https://api.weatherapi.com/v1/forecast.json";
  static const String _apiKey = "830e07a3d18c4065970130104252203";

  Future<String> _fetchLocation() async {
    try {
      final location = await getCurrentLocation();
      return "${location.latitude},${location.longitude}";
    } catch (e) {
      throw Exception("Không thể lấy vị trí: $e");
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final location = await _fetchLocation();
    final url = Uri.parse('$_baseUrl?q=$location&days=5&key=$_apiKey&lang=vi');

    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception("Lỗi khi lấy dữ liệu từ API: ${response.body}");
      }

      final decodedData = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(decodedData);

      return jsonData as Map<String, dynamic>;
    } catch (e) {
      throw Exception("Lỗi kết nối API: $e");
    }
  }
}
