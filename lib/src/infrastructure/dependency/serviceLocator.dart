import 'package:get/get.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';
import 'package:weather_app/src/ui/ui.dart';

void setupLocator() {
  // Repositories
  Get.lazyPut(() => AppTheme(), fenix: true);
  Get.lazyPut<IWeatherRepository>(() => WeatherRepository(), fenix: true);
  Get.lazyPut<BaseLocalManager<City>>(() => CityDb(), fenix: true);

  //Services
  Get.lazyPut<IWeatherService>(() => WeatherService(Get.find<IWeatherRepository>()), fenix: true);
  Get.lazyPut<ICityService>(() => CityService(localService: Get.find<BaseLocalManager<City>>()), fenix: true);
}
