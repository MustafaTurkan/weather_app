import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/interfaces/IWeatherService.dart';

class WeatherService implements IWeatherService {
  final IWeatherRepository repository;

  WeatherService(this.repository);

  @override
  Future<Weather> currentWeatherByCityName(String cityName) {
    return repository.currentWeatherByCityName(cityName);
  }
}
