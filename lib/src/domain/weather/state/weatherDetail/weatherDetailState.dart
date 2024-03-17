part of 'weatherDetailCubit.dart';

sealed class WeatherDetailState {}

final class WeatherDetailInitial extends WeatherDetailState {}

final class WeatherDetailLoading extends WeatherDetailState {}

final class WeatherDetailLoaded extends WeatherDetailState {
  final Weather? model;
  WeatherDetailLoaded({this.model});
}

final class WeatherDetailFail extends WeatherDetailState {
  final String? message;
  WeatherDetailFail({this.message});
}
