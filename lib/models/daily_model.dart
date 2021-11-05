import 'package:hive/hive.dart';

part 'daily_model.g.dart';

@HiveType(typeId: 2)
class DailyModel extends HiveObject {
  @HiveField(0)
  final int dt;
  @HiveField(1)
  final double sunrise;
  @HiveField(2)
  final double sunset;
  @HiveField(3)
  final double moonrise;
  @HiveField(4)
  final double moonset;
  @HiveField(5)
  final double moonPhase;
  @HiveField(6)
  final Temp temp;
  @HiveField(7)
  final FeelsLike feelsLike;
  @HiveField(8)
  final double pressure;
  @HiveField(9)
  final double humidity;
  @HiveField(10)
  final double windSpeed;
  @HiveField(11)
  final String main;

  DailyModel({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.main,
  });

  DailyModel.fromJson(Map<String, dynamic> json)
      : dt = json['dt'],
        sunrise = json['sunrise'].toDouble(),
        sunset = json['sunset'].toDouble(),
        moonrise = json['moonrise'].toDouble(),
        moonset = json['moonset'].toDouble(),
        moonPhase = json['moon_phase'].toDouble(),
        temp = Temp.fromJson(json['temp']),
        feelsLike = FeelsLike.fromJson(json['feels_like']),
        pressure = json['pressure'].toDouble(),
        humidity = json['humidity'].toDouble(),
        windSpeed = json['wind_speed'].toDouble(),
        main = json['weather'][0]['main'];
}

@HiveType(typeId: 3)
class Temp extends HiveObject {
  @HiveField(1)
  final double day;
  @HiveField(2)
  final double min;
  @HiveField(3)
  final double max;
  @HiveField(4)
  final double night;
  @HiveField(5)
  final double eve;
  @HiveField(6)
  final double morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  Temp.fromJson(Map<String, dynamic> json)
      : day = json['day'].toDouble(),
        min = json['min'].toDouble(),
        max = json['max'].toDouble(),
        night = json['night'].toDouble(),
        eve = json['eve'].toDouble(),
        morn = json['morn'].toDouble();
}

@HiveType(typeId: 4)
class FeelsLike extends HiveObject {
  @HiveField(0)
  final double day;
  @HiveField(1)
  final double night;
  @HiveField(2)
  final double eve;
  @HiveField(3)
  final double morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  FeelsLike.fromJson(Map<String, dynamic> json)
      : day = json['day'].toDouble(),
        night = json['night'].toDouble(),
        eve = json['eve'].toDouble(),
        morn = json['morn'].toDouble();
}
