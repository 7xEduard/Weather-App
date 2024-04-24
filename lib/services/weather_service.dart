import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'be57c3eb933a4939ae4235627242703';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherModel;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=5');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      weatherModel = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weatherModel;
  }
}
