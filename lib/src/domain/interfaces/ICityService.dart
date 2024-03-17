import 'package:weather_app/src/data/data.dart';

abstract class ICityService {
  Future<void> add(String cityName);
  List<City>? getAll();
  Future<void> delete(String cityName);
  bool checkList(String cityName);
}
