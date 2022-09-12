import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
final supportedLocales = [
  const Locale('en', 'US'), // English
  //Locale('es', ''), // Spanish, no country code
];
