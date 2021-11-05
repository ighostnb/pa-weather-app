import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/models/daily_model.dart';
import 'package:weather/models/hourly_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/utils/boxes.dart';

class HiveDatabase {
  Future initDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(WeatherModelAdapter());
    Hive.registerAdapter(DailyModelAdapter());
    Hive.registerAdapter(HourlyModelAdapter());
    Hive.registerAdapter(FeelsLikeAdapter());
    Hive.registerAdapter(TempAdapter());
    await Hive.openBox<WeatherModel>('weather');
  }

  void overwriteWeather(WeatherModel weather) {
    final box = Boxes.getWeather();
    box.put('weather', weather);
  }
}
