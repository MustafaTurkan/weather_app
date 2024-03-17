import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static get fallbackLocale {
    return trTrLocale;
  }

  static const trTrLocale = Locale('tr', 'TR');
  static const enUsLocale = Locale('en', 'US');
  static const enUKLocale = Locale('en', 'UK');

  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': tr,
      };
}

enum Language {
  turkish,
  english,
}

extension LanguageExtension on Language {
  String get value {
    switch (this) {
      case Language.english:
        return 'English';
      default:
        return 'Türkçe';
    }
  }
}
