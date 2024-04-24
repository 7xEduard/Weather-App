class WeatherModel {
  final String name;
  final String date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherState;
  final String sunrise;
  final String sunset;

  WeatherModel(
      {required this.name,
      required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherState,
      required this.sunrise,
      required this.sunset});

//Factory Constructor for build object form weather API
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0];

    return WeatherModel(
        name: data['location']['name'],
        date: data['location']['localtime'],
        temp: jsonData['day']['avgtemp_c'],
        minTemp: jsonData['day']['mintemp_c'],
        maxTemp: jsonData['day']['maxtemp_c'],
        weatherState: jsonData['day']['condition']['text'],
        sunrise: jsonData['astro']['sunrise'],
        sunset: jsonData['astro']['sunset']
        // icon: data['current']['condition']['icon']
        );
  }

  String getIcon() {
    if (weatherState.toLowerCase().contains('clear') ||
        weatherState.toLowerCase().contains('sunny')) {
      return 'assets/6.png';
    } else if (weatherState.toLowerCase().contains('snow') ||
        weatherState.toLowerCase().contains('hail') ||
        weatherState.toLowerCase().contains('sleet') ||
        weatherState.toLowerCase().contains('freezing')) {
      return 'assets/4.png';
    } else if (weatherState.toLowerCase().contains('thunder storm') ||
        weatherState.toLowerCase().contains('thunderstorm') ||
        weatherState.toLowerCase().contains('thunder')) {
      return 'assets/1.png';
    } else if (weatherState.toLowerCase().contains('heavy rain')) {
      return 'assets/3.png';
    } else if (weatherState.toLowerCase().contains('light rain') ||
        weatherState.toLowerCase().contains('showers') ||
        weatherState.toLowerCase().contains('rain')) {
      return 'assets/2.png';
    } else if (weatherState.toLowerCase() == 'partly cloudy ') {
      return 'assets/8.png';
    } else if (weatherState.toLowerCase().contains('cloud')) {
      return 'assets/7.png';
    } else {
      return 'assets/7.png';
    }
  }

  @override
  String toString() {
    return 'Date =$date  Temp =$temp  MinTemp =$minTemp';
  }
}
