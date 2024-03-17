import 'package:bloc/bloc.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/domain.dart';

part 'weatherListState.dart';

class WeatherListCubit extends Cubit<WeatherListState> {
  List<Weather>? list;
  final ICityService cityService;
  WeatherListCubit(this.cityService)
      : super(WeatherListState(
          listLoad: true,
          detailsBuilderStart: true,
        ));

  void addListItemByItemBuilder(String city, Weather model) {
    list ??= <Weather>[];

    var check = list!.any((e) => e.areaName!.toLowerCase() == city.toLowerCase());
    if (!check) {
      list!.add(model);
      emit(state.copy(list: list, detailsBuilderStart: false, listLoad: false));
    }
  }

  void addListItemByNewCity(Weather model) {
    list ??= <Weather>[];
    list!.add(model);
    emit(state.copy(list: list, detailsBuilderStart: false, listLoad: true));
  }

  void reload() {
    list?.clear();
    emit(state.copy(list: list, detailsBuilderStart: true, listLoad: true));
  }

  Future<void> delete(String city) async {
    await cityService.delete(city);
    list!.removeWhere((e) => e.areaName!.toLowerCase() == city.toLowerCase());
    emit(state.copy(detailsBuilderStart: false, list: list, listLoad: true));
  }
}
