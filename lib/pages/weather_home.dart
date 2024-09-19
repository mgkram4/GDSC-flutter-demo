import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../widgets/weather_display.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  String _city = 'La Verne';
  WeatherModel? _weatherData;
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cityController.text = _city;
    _fetchWeather();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeather() async {
    try {
      final weatherData = await _weatherService.getWeather(_city);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print('Error fetching weather: $e');
    }
  }

  String _celsiusToFahrenheit(String celsius) {
    return ((double.parse(celsius) * 9 / 5) + 32).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _city = _cityController.text;
                    });
                    _fetchWeather();
                  },
                ),
              ),
              onSubmitted: (value) {
                setState(() {
                  _city = value;
                });
                _fetchWeather();
              },
            ),
            const SizedBox(height: 20),
            if (_weatherData == null)
              const CircularProgressIndicator()
            else
              WeatherDisplay(
                weather: WeatherModel(
                  temperature: _celsiusToFahrenheit(_weatherData!.temperature),
                  condition: _weatherData!.condition,
                ),
                isFahrenheit: true,
              ),
          ],
        ),
      ),
    );
  }
}
