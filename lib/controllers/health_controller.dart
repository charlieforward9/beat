import 'dart:io';

import 'package:health/health.dart';
import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

import 'dart:math';

// import data models
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:beat/data/DateTimeService.dart';
import 'package:beat/data/Goal/repository/GoalRepository.dart';
import 'package:flutter/cupertino.dart';

import '../models/ModelProvider.dart';

// service imports
import '../data/Activity/services/ActivityService.dart';
import '../data/Goal/services/GoalService.dart';
import '../data/Metrics/repository/MetricRepository.dart';
import '../data/User/services/UserService.dart';

// testing global
import '../config/global.dart' as globalTest;

void testingHealth() async {
  // create a HealthFactory for use in the app
  HealthFactory health = HealthFactory();

  // define the types to get
  final types = [
    HealthDataType.STEPS,
    // Uncomment these lines on iOS - only available on iOS
    // HealthDataType.AUDIOGRAM
  ];

  // with coresponsing permissions
  final permissions = [
    HealthDataAccess.READ,
    // HealthDataAccess.READ,
  ];
  // get data within the last 24 hours
  final now = DateTime.now();
  final yesterday = now.subtract(Duration(days: 5));
  // requesting access to the data types before reading them
  // note that strictly speaking, the [permissions] are not
  // needed, since we only want READ access.
  if (Platform.isAndroid) {
    final permissionStatus = Permission.activityRecognition.request();
    if (await permissionStatus.isDenied ||
        await permissionStatus.isPermanentlyDenied) {
      debugPrint(
          'activityRecognition permission required to fetch your steps count');
      return;
    }
  }
  bool requested =
      await health.requestAuthorization(types, permissions: permissions);
  print('requested: $requested');
}
