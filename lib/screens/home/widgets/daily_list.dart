import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/models/daily_model.dart';
import 'package:weather/utils/day_timestamp.dart';
import 'package:weather/utils/weather_icon.dart';

class DailyList extends StatelessWidget {
  final List<DailyModel> daily;
  const DailyList(this.daily, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: ListView.builder(
        itemCount: daily.length,
        itemBuilder: (context, index) {
          String day =
              DayTimestamp().getDayFromTimestamp(daily[index].dt, context);
          String iconPath = WeatherIcon().getWeatherIcon(daily[index].main);

          String temp = ((daily[index].temp.min + daily[index].temp.max) / 2)
              .round()
              .toString();
          String feelsLike = ((daily[index].feelsLike.day +
                      daily[index].feelsLike.eve +
                      daily[index].feelsLike.morn +
                      daily[index].feelsLike.night) /
                  4)
              .round()
              .toString();
          return SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
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
          );
        },
      ),
    );
  }
}
