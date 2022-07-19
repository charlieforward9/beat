import 'package:flutter/material.dart';
import 'package:beat/views/home_widgets/appcolors.dart';

@immutable
class BeatTheme {
  static const colors = AppColors();

  const BeatTheme._();

  static ThemeData define() {
    return ThemeData(fontFamily: "Georgia");
  }
}
