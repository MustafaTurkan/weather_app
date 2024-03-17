part of 'weatherListCubit.dart';

class WeatherListState {
  final bool detailsBuilderStart;
  final bool listLoad;
  final List<Weather>? list;
  final Weather? addedItem;

  WeatherListState({required this.detailsBuilderStart, required this.listLoad, this.list, this.addedItem});

  WeatherListState copy({bool? detailsBuilderStart, bool? listLoad, List<Weather>? list, Weather? addedItem}) {
    return WeatherListState(
        listLoad: listLoad ?? false, detailsBuilderStart: detailsBuilderStart ?? false, list: list ?? this.list, addedItem: addedItem);
  }
}
