import 'package:flutter/material.dart';
import 'package:weather/constants/color_const.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(
          color: progressIndicatorColor,
        ),
      );
}
