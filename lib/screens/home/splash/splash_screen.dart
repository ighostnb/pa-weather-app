import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/weather/weather_cubit.dart';
import 'package:weather/constants/color_const.dart';
import 'package:weather/screens/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherCubit weatherCubit = BlocProvider.of<WeatherCubit>(context);
    weatherCubit.fetchWeather();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash_image.png',
              height: 150,
            ),
            const Text('In app splash'),
          ],
        ),
      );
}
