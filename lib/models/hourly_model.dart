import 'package:hive/hive.dart';

part 'hourly_model.g.dart';

@HiveType(typeId: 1)
class HourlyModel extends HiveObject {
  @HiveField(0)
  final int dt;
  @HiveField(1)
  final double temp;
  @HiveField(2)
  final double feelsLike;
  @HiveField(3)
  final int pressure;
  @HiveField(4)
  final int humidity;
  @HiveField(5)
  final double windSpeed;
  @HiveField(6)
  final String main;

  HourlyModel({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.main,
  });

  HourlyModel.fromJson(Map<String, dynamic> json)
      : dt = json['dt'].round(),
        temp = json['temp'].toDouble(),
        feelsLike = json['feels_like'].toDouble(),
        pressure = json['pressure'].round(),
        humidity = json['humidity'].round(),
        windSpeed = json['wind_speed'].toDouble(),
        main = json['weather'][0]['main'];
}
