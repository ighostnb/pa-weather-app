import 'package:weather/models/weather_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<WeatherModel> getWeather() => Hive.box<WeatherModel>('weather');
}
