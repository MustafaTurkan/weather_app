import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';

class WeatherRepository extends BaseRepository implements IWeatherRepository {
  @override
  Future<Weather> currentWeatherByCityName(String cityName) async {
    var jsonResponse = await get(WeatherType.currentWeather.value, cityName: cityName);
    return Weather(jsonResponse!);
  }

  @override
  Future<Weather> currentWeatherByLocation(double latitude, double longitude) async {
    Map<String, dynamic>? jsonResponse = await get(WeatherType.currentWeather.value, lat: latitude, lon: longitude);
    return Weather(jsonResponse!);
  }
}
