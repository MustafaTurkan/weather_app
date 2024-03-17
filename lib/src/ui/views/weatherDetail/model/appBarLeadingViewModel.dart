import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/ui/ui.dart';

abstract class AppBarLeadingViewModel extends State<WeatherAppBarLeading> {
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

  Future<void> onPress() async {
    Get.back();
  }
}
