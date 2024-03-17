import 'package:bloc/bloc.dart';
import 'package:weather_app/src/data/data.dart';
import 'package:weather_app/src/domain/interfaces/IWeatherService.dart';

part 'weatherDetailState.dart';

class WeatherDetailCubit extends Cubit<WeatherDetailState> {
  WeatherDetailCubit(this.service) : super(WeatherDetailInitial());

  final IWeatherService service;

  Future<void> load(String city, {Weather? model}) async {
    try {
      if (model != null) {
        emit(WeatherDetailLoaded(model: model));
        return;
      }
      emit(WeatherDetailLoading());
      var result = await service.currentWeatherByCityName(city);
      if (isClosed) {
        return;
      }
      emit(WeatherDetailLoaded(model: result));
    } catch (e) {
      emit(WeatherDetailFail(message: e.toString()));
    }
  }
}
