import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModelProvider;

  set weatherModelProvider(WeatherModel? weatherModel) {
    _weatherModelProvider = weatherModel;
    notifyListeners();
  }
  WeatherModel? get weatherModelProvider => _weatherModelProvider;
}
