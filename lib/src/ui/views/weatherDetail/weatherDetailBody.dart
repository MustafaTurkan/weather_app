import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/ui/ui.dart';

class WeatherDetailBody extends StatelessWidget {
  const WeatherDetailBody({super.key, required this.model});
  final Weather model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardTile(
                title: 'temperature'.tr,
                body: CelsiusText(
                    value: model.temperature!.celsius!.ceil().toString(),
                    style: AppTheme.to.textStyles!.h1.copyWith(color: AppTheme.to.colors!.canvasPrimaryPale, fontWeight: FontWeight.bold))),
            CardTile(
              title: 'wind_speed'.tr,
              body: Text('${model.windSpeed!.toString()} m/sn',
                  style: AppTheme.to.textStyles!.h1.copyWith(color: AppTheme.to.colors!.canvasPrimaryPale, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardTile(
                title: 'humidity'.tr,
                body: Text('${model.humidity!.ceil().toString()}%',
                    style: AppTheme.to.textStyles!.h1.copyWith(color: AppTheme.to.colors!.canvasPrimaryPale, fontWeight: FontWeight.bold))),
            CardTile(
              title: 'cloudiness'.tr,
              body: Text('${model.cloudiness!.ceil().toString()}%',
                  style: AppTheme.to.textStyles!.h1.copyWith(color: AppTheme.to.colors!.canvasPrimaryPale, fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }
}
