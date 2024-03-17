import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/interfaces/IWeatherService.dart';
import 'package:weather_app/src/domain/weather/state/weatherDetail/weatherDetailCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/ui/ui.dart';

class WeatherDetailPage extends StatelessWidget {
  const WeatherDetailPage({super.key, required this.city, this.model});

  final String city;
  final Weather? model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherDetailCubit>(
      key: GlobalKey(),
      create: (context) => WeatherDetailCubit(Get.find<IWeatherService>())..load(city),
      child: Scaffold(
        appBar: AppBar(
          leading: WeatherAppBarLeading(city: city),
          actions: <Widget>[WeatherAppBarIcon(city: city)],
        ),
        body: BlocBuilder<WeatherDetailCubit, WeatherDetailState>(
          builder: (context, state) {
            if (state is WeatherDetailLoading) {
              return const LoadingView();
            }
            if (state is WeatherDetailLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WeatherDetailHeader(model: state.model!),
                    const SizedBox(
                      height: 20,
                    ),
                    WeatherDetailBody(model: state.model!)
                  ],
                ),
              );
            }

            return Center(child: Text('empty_weather'.tr));
          },
        ),
      ),
    );
  }
}
