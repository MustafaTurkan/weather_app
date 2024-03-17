import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/ui/styles/app_theme_data.dart';
import 'package:weather_app/src/ui/styles/iapp_colors.dart';
import 'package:weather_app/src/ui/styles/iapp_text_styles.dart';

class AppTheme extends GetxController {
  static AppTheme get to => Get.find<AppTheme>();
  IAppColors? _colors;
  IAppColors? get colors => _colors;

  ThemeData? _data;
  ThemeData? get data => _data;

  IAppTextStyles? _textStyles;
  IAppTextStyles? get textStyles => _textStyles;

  bool get initialize => colors != null && data != null && _textStyles != null;

  void setTheme(AppThemeData appThemeData) {
    var shouldNotifyListeners = initialized;
    _colors = appThemeData.color;
    _data = appThemeData.data;
    _textStyles = appThemeData.textStyles;

    if (shouldNotifyListeners) {
      update();
    }
  }
}
