import 'package:flutter/material.dart';
import 'package:beat/UI/appcolors.dart';

@immutable
class BeatTheme {
  static const colors = AppColors();

  const AppTheme1._();

  static ThemeData define() {
    return ThemeData(fontFamily: "Georgia");
  }
}
