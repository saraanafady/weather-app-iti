import 'dart:convert';
import 'package:day4/models/wether-api.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _apiKey = '979e237b0f5e09e3c71616ac4781af58'; 
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherModel> fetchWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=$cityName&appid=$_apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
