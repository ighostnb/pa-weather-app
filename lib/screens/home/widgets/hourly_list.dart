import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/models/hourly_model.dart';
import 'package:weather/utils/day_timestamp.dart';
import 'package:weather/utils/weather_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HourlyList extends StatelessWidget {
  final List<HourlyModel> hourly;
  const HourlyList(this.hourly, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: ListView.builder(
        itemCount: hourly.length,
        itemBuilder: (context, index) {
          String day =
              DayTimestamp().getDayFromTimestamp(hourly[index].dt, context);
          String iconPath = WeatherIcon().getWeatherIcon(hourly[index].main);

          String temp = hourly[index].temp.round().toString();
          String feelsLike = hourly[index].feelsLike.round().toString();
          var date =
              DateTime.fromMillisecondsSinceEpoch(hourly[index].dt * 1000);
          var t = AppLocalizations.of(context);
          String time = '${date.hour} ${t!.hour}';
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    time,
                    style: const TextStyle(fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        day,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        temp + ' C°',
                        style: const TextStyle(
                            fontSize: 21,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        feelsLike + ' C°',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      SvgPicture.asset(
                        iconPath,
                        height: 50,
                        width: 50,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
