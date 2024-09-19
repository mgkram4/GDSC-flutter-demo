import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_model.dart';
import '../config/env.dart';

class WeatherService {
  Future<WeatherModel> getWeather(String city) async {
    final apiKey = Env.weatherApiKey;
    final url = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel(
        temperature: data['main']['temp'].toString(),
        condition: data['weather'][0]['main'],
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
