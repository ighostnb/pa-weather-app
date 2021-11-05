import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/utils/boxes.dart';
import 'package:weather/utils/hive_database.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;
  WeatherCubit(this._repository) : super(WeatherInitialState());

  void fetchWeather() async {
    try {
      emit(WeatherLoadingState());
      final box = Boxes.getWeather();
      final WeatherModel? weather = await _repository.getWeather();
      if (weather != null) {
        HiveDatabase().overwriteWeather(weather);
      }

      if (box.isEmpty) {
        emit(WeatherErrorState('0'));
      } else {
        emit(WeatherLoadedState(box.get('weather')!));
      }
    } catch (_) {
      emit(WeatherErrorState(_.toString()));
    }
  }
}
