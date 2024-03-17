import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';

class CityService implements ICityService {
  final BaseLocalManager<City> localService;

  CityService({required this.localService});

  @override
  Future<void> add(String cityName) async {
    await localService.add(cityName, City(name: cityName));
  }

  @override
  Future<void> delete(String cityName) async {
    await localService.delete(cityName);
  }

  @override
  List<City>? getAll() {
    return localService.getAll();
  }

  @override
  bool checkList(String cityName) {
    var list = localService.getAll();
    if (list.isNullOrEmpty()) {
      return false;
    }
    return list!.any((e) => e.name == cityName);
  }
}
