import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';

class LocalManagerHelper {
  static Future<void> init() async {
    Directory? dir = await getExternalStorageDirectory();
    if (dir != null) {
      Hive.init(dir.path);
    }
  }

  static Future<void> changeDb() async {
    await Hive.close();
    await initGlobalBox();
  }

  static Future<void> initGlobalBox() async {
    await Get.find<BaseLocalManager<City>>().initBox();
  }
}
