import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/ui/ui.dart';

abstract class HomeViewModel extends State<HomePage> {
  late ICityService _service;

  List<City>? get cities {
    return _service.getAll();
  }

  @override
  void initState() {
    _service = Get.find<ICityService>();

    super.initState();
  }

  Future<void> onPressedSearch(BuildContext context, String? val) async {
    Get.back();
    var result = await Get.to<Weather>(WeatherDetailPage(city: val!));
    if (result != null) {
      context.read<WeatherListCubit>().addListItemByNewCity(result);
    }
  }

  Weather? getWeather(String city, List<Weather>? list) {
    var result = list?.firstWhereOrNull((e) => e.areaName!.toLowerCase().contains(city.toLowerCase()));
    return result;
  }
}
