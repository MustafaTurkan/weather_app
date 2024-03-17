enum WeatherType { currentWeather, fiveDayForecast }

extension WeatherTypeEnumExt on WeatherType {
  String get value {
    switch (this) {
      case WeatherType.currentWeather:
        return "weather";
      default:
        return "forecast";
    }
  }
}
