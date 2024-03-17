import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/ui/ui.dart';

class WeatherDetailHeader extends StatelessWidget {
  const WeatherDetailHeader({super.key, required this.model});
  final Weather model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        color: AppTheme.to.colors!.canvasDark,
        child: Column(
          children: [
            Center(
              child: Text(model.areaName!, style: AppTheme.to.textStyles!.diplay4.copyWith(), textAlign: TextAlign.center),
            ),
            Center(
              child: CelsiusText(
                value: model.temperature!.celsius!.ceil().toString(),
                style: AppTheme.to.textStyles!.diplay2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              model.weatherDescription!,
              style: AppTheme.to.textStyles!.h1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(
                  FontAwesomeIcons.arrowDown,
                  size: 12,
                ),
                CelsiusText(
                  value: model.tempMin!.celsius!.ceil().toString(),
                  style: AppTheme.to.textStyles!.bodyL.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                const FaIcon(
                  FontAwesomeIcons.arrowUp,
                  size: 12,
                ),
                CelsiusText(
                  value: model.tempMax!.celsius!.ceil().toString(),
                  style: AppTheme.to.textStyles!.bodyL.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
