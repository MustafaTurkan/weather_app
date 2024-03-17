import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/ui/ui.dart';

abstract class AppBarIconViewModel extends State<WeatherAppBarIcon> {
  late ICityService _service;
  List<City>? cities;
  @override
  void initState() {
    _service = Get.find<ICityService>();
    super.initState();
  }

  bool check() {
    return _service.checkList(widget.city);
  }

  Future<void> onPress(Weather? weather) async {
    if (!check()) {
      await _service.add(widget.city);
      Get.back<Weather>(result: weather);
      return;
    }
    Get.back();
  }
}
