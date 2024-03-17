import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/infrastructure/dependency/serviceLocator.dart';

import 'infrastructure/infrastructure.dart';
import 'ui/ui.dart';

class App {
  Future<void> run() async {
    Future<void> buildAppServices() async {
      Bloc.observer = const AppBlocObserver();
      setupLocator();
      await LocalManagerHelper.init();
      await LocalManagerHelper.initGlobalBox();
    }

    WidgetsFlutterBinding.ensureInitialized();
    setSystemChromeSettings();
    await buildAppServices();
    runApp(const AppWidget());
  }

  void setSystemChromeSettings() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: TranslationService.fallbackLocale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, widget) => _builder(context, widget),
      home: const HomePage(),
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    return GetBuilder<AppTheme>(
      init: AppTheme.to,
      builder: (model) {
        if (!model.initialize) {
          model.setTheme(buildDefaultTheme(context));
        }
        return Theme(data: model.data!, child: child!);
      },
    );
  }
}
