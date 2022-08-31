import 'package:flutter/material.dart';

@immutable
class BeatTheme {
  static const colors = AppColors();

  const BeatTheme._();

  static ThemeData define() {
    return ThemeData(fontFamily: "Georgia");
  }
}

@immutable
class AppColors {
  final fitnessColor = const Color.fromARGB(255, 255, 99, 99);
  final fuelingColor = const Color.fromARGB(255, 255, 255, 87);
  final restColor = const Color.fromARGB(255, 162, 108, 255);
  final socialColor = const Color.fromARGB(255, 169, 201, 255);
  final workColor = const Color.fromARGB(255, 109, 254, 140);

  const AppColors();
}
