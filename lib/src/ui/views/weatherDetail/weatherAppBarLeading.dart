import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/src/ui/ui.dart';

class WeatherAppBarLeading extends StatefulWidget {
  const WeatherAppBarLeading({super.key, required this.city});
  final String city;

  @override
  State<WeatherAppBarLeading> createState() => _WeatherAppBarLeadingState();
}

class _WeatherAppBarLeadingState extends AppBarLeadingViewModel {
  @override
  Widget build(BuildContext context) {
    if (check()) {
      return const SizedBox.shrink();
    }
    return IconButton(
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        onPressed: () async {
          await onPress();
        });
  }
}
