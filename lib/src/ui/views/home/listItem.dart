import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/ui/ui.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.city, this.weather, this.reload});

  final String city;
  final Weather? weather;
  final bool? reload;

  @override
  Widget build(BuildContext context) {
    if (weather != null) {
      return buildWidget(context, weather);
    }
    return BlocProvider(
      key: GlobalKey(),
      create: (context) => WeatherDetailCubit(Get.find<IWeatherService>())..load(city),
      child: BlocBuilder<WeatherDetailCubit, WeatherDetailState>(
        buildWhen: (previous, current) => weather == null,
        builder: (context, state) {
          if (state is WeatherDetailLoaded) {
            context.read<WeatherListCubit>().addListItemByItemBuilder(city, state.model!);
          }
          return buildWidget(context, state is WeatherDetailLoaded ? state.model : null);
        },
      ),
    );
  }

  Widget buildWidget(BuildContext context, Weather? model) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
      child: OpenContainerWrapper(
          transitionType: ContainerTransitionType.fadeThrough,
          closedBuilder: (context, action) {
            return InkWell(
              onTap: action,
              child: Slidable(
                  key: GlobalKey(),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.25,
                    children: [
                      buildDelete(context),
                    ],
                  ),
                  child: buildCard(model)),
            );
          },
          child: WeatherDetailPage(
            city: city,
            model: model,
          )),
    );
  }

  Widget buildCard(Weather? model) {
    return Card(
        color: AppTheme.to.colors!.canvasPrimaryPale,
        child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [buildCityText(), buildDescText(model?.weatherDescription)],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: buildCelsius(model),
                ),
              ],
            )));
  }

  InkWell buildDelete(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.read<WeatherListCubit>().delete(city);
      },
      child: Container(
        color: AppTheme.to.colors!.error,
        width: Get.width * 0.20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.trash),
            const SizedBox(
              height: 4,
            ),
            Text(
              'delete'.tr,
              style: AppTheme.to.textStyles!.body.copyWith(color: AppTheme.to.colors!.canvas),
            )
          ],
        ),
      ),
    );
  }

  CelsiusText buildCelsius(Weather? model) {
    return CelsiusText(
        value: model?.temperature?.celsius?.ceil().toString() ?? '-', style: AppTheme.to.textStyles!.diplay3.copyWith(fontWeight: FontWeight.bold));
  }

  Widget buildCityText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        city,
        style: AppTheme.to.textStyles!.h3.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildDescText(String? desc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        desc ?? "-",
        style: AppTheme.to.textStyles!.bodyL,
      ),
    );
  }
}
