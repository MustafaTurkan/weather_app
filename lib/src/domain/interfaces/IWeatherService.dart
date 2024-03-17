import 'package:weather_app/src/data/data.dart';

abstract class IWeatherService {
  Future<Weather> currentWeatherByCityName(String cityName);
}
