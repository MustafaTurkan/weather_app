import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/ui/ui.dart';

class WeatherAppBarIcon extends StatefulWidget {
  const WeatherAppBarIcon({super.key, required this.city});
  final String city;

  @override
  State<WeatherAppBarIcon> createState() => _WeatherAppBarIconState();
}

class _WeatherAppBarIconState extends AppBarIconViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherDetailCubit, WeatherDetailState>(
      builder: (context, state) {
        return IconButton(
            icon: check() ? const FaIcon(FontAwesomeIcons.xmark) : const FaIcon(FontAwesomeIcons.plus),
            onPressed: () async {
              var model = state is WeatherDetailLoaded ? state.model : null;
              await onPress(model);
            });
      },
    );
  }
}
