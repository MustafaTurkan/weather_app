import 'package:weather_app/src/data/data.dart';

abstract class IWeatherRepository {
  Future<Weather> currentWeatherByLocation(double latitude, double longitude);
  Future<Weather> currentWeatherByCityName(String cityName);
}
