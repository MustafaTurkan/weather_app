import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';
import 'package:weather_app/src/ui/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('weather'.tr),
      ),
      body: BlocProvider(
        create: (context) => WeatherListCubit(Get.find<ICityService>()),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<WeatherListCubit, WeatherListState>(
            buildWhen: (previous, current) => current.listLoad,
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<WeatherListCubit>().reload();
                },
                child: Column(
                  children: [
                    SearchTextField(
                      onTap: (val) async {
                        await onPressedSearch(context, val);
                      },
                    ),
                    if (!cities.isNullOrEmpty())
                      Expanded(
                        child: AnimationList(
                          shrinkWrap: true,
                          length: cities!.length,
                          itemBuilder: (context, index) {
                            var item = cities![index];
                            return ListItem(
                              city: item.name!,
                              weather: getWeather(item.name!, state.list),
                            );
                          },
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
