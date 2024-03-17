import 'package:weather_app/src/data/model/city.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';

class CityDb extends BaseLocalManager<City> {
  CityDb() : super(Constants.cityCache, adapter: CityAdapter(), typeId: Constants.cityHiveTypeId);
}
