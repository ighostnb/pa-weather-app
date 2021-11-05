import 'package:hive/hive.dart';
import 'package:weather/models/daily_model.dart';
import 'package:weather/models/hourly_model.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 0)
class WeatherModel extends HiveObject {
  @HiveField(0)
  late double lat;
  @HiveField(1)
  late double lon;
  @HiveField(2)
  late String timezone;
  @HiveField(3)
  late int timezoneOffset;
  @HiveField(4)
  late List<DailyModel> daily;
  @HiveField(5)
  late List<HourlyModel> hourly;

  WeatherModel({
    required this.daily,
    required this.hourly,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'].toDouble();
    lon = json['lon'].toDouble();
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'].round();
    List<DailyModel> list = [];
    json['daily'].forEach((el) => list.add(DailyModel.fromJson(el)));
    daily = list;
    List<HourlyModel> hour = [];
    json['hourly'].forEach((el) => hour.add(HourlyModel.fromJson(el)));
    hourly = hour;
  }
}
