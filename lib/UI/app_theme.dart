import 'package:flutter/material.dart';
import 'package:beat/UI/appcolors.dart';

@immutable
class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(fontFamily: "Georgia");
  }
}
