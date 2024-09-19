import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String condition;

  const WeatherIcon({super.key, required this.condition});

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return Icons.wb_sunny;
      case 'clouds':
        return Icons.cloud;
      case 'rain':
        return Icons.beach_access;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getWeatherIcon(condition),
      size: 100.0,
    );
  }
}