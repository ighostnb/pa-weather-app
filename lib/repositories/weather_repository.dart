import 'dart:convert';

import 'package:weather/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather/utils/geolocation.dart';
import 'package:weather/utils/secret.dart';
import 'package:weather/utils/secret_loader.dart';
import 'package:geolocator/geolocator.dart';

abstract class WeatherRepository {
  Future<WeatherModel?> getWeather();
}

class WeatherRepositoryImpl extends WeatherRepository {
  @override
  Future<WeatherModel?> getWeather() async {
    try {
      Secret secret = await SecretLoader(secretPath: 'secret_key.json').load();
      Position position = await getPosition();

      final Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${position.latitude}&lon=${position.longitude}&exclude=minutely,current,alerts&appid=${secret.apiKey}&units=metric',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return WeatherModel.fromJson(data);
      }

      return null;
    } catch (_) {
      print(_);
      return null;
    }
  }
}
