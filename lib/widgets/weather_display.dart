import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

import 'weather_icon.dart';

class WeatherDisplay extends StatelessWidget {
  final WeatherModel weather;

  WeatherDisplay({required this.weather, required bool isFahrenheit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WeatherIcon(condition: weather.condition),
        const SizedBox(height: 20.0),
        Text(
          '${weather.temperature}°C',
          style: const TextStyle(fontSize: 40.0),
        ),
        Text(
          weather.condition,
          style: const TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
