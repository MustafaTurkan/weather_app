import 'package:hive/hive.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';
part 'city.g.dart';

@HiveType(typeId: Constants.cityHiveTypeId)
class City {
  City({this.name});
  @HiveField(0)
  final String? name;
}
