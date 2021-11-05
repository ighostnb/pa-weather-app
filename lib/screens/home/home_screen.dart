import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:weather/blocs/weather/weather_cubit.dart';
import 'package:weather/constants/color_const.dart';
import 'package:weather/screens/home/widgets/daily_list.dart';
import 'package:weather/screens/home/widgets/hourly_list.dart';
import 'package:weather/utils/geolocation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDaily = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _buildBody(),
      appBar: _buildAppBar(context),
    );
  }

  AppBar _buildAppBar(context) => AppBar(
        title: Text(AppLocalizations.of(context)!.title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: appBarBackgroundColor.withOpacity(0.7),
        leading: InkWell(
          child: const Icon(
            Icons.refresh,
            size: 35,
          ),
          onTap: () {
            WeatherCubit weatherCubit = BlocProvider.of<WeatherCubit>(context);
            weatherCubit.fetchWeather();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              child: SvgPicture.asset(
                'assets/clock.svg',
                height: 35,
              ),
              onTap: () => setState(() => _isDaily = !_isDaily),
            ),
          )
        ],
      );

  Widget _buildBody() =>
      BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        var t = AppLocalizations.of(context);

        if (state is WeatherLoadingState) return const Loading();

        if (state is WeatherLoadedState) {
          if (state.weather.daily.length > 7) {
            state.weather.daily.removeAt(7);
          }
          return _isDaily
              ? DailyList(state.weather.daily)
              : HourlyList(state.weather.hourly);
        }

        if (state is WeatherErrorState) {
          return state.error == '0'
              ? Center(
                  child: Text(t!.internet_error),
                )
              : Center(
                  child: Text(state.error),
                );
        }

        return Container();
      });
}
