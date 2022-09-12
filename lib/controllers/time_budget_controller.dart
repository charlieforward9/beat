//IMPORT STATEMENT SHOULD LOOK LIKE THIS
//import '<PATH>' as TimeBudgetController;
import 'dart:developer';

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

GoalService goalService = GoalService();
ActivityService activityService = ActivityService();

Future<Goal> getGoal() async {
  @override
  String userID = "190c7bd1-02ad-4ab1-970d-49b8e6f7a9f8";
  CategoryTypes tmp = CategoryTypes.FITNESS;
  Goal tempGoal = await goalService.getGoal(userID, tmp, null);
  String goalID = tempGoal.getId();
  print("Testing GoalID: $goalID");
  return tempGoal;
}

// Future<Goal> getAllActivities(String goalID) async {
//   // testGetGoalActivities();
//   Goal tempGoal = await goalService.getGoalByGoalID(goalID);
//   // print(tempGoal);

//   return tempGoal;
// }

//TODO double check that this contoller works with a non-hard-coded values
Future<void> createActivity() async {
  debugPrint("Creating Activity....");
  int rand = Random().nextInt(100);
  DateTime now = DateTime.now();
  final loc = DTService().localDT;
  final utc = DTService().utcDT;
  DurationBeat dur = DurationBeat(
      hours: rand, minutes: rand, seconds: rand);

  activityService.createActivity(
    loc,
    utc,
    CategoryTypes.FITNESS,
    dur,
    "f49cf805-6ada-4731-87a6-8b1fb027660c",
  );
}

Future<List<Activity>> getGoalActivities(String goalID) async {
  int sumHours = 0;
  int sumMinutes = 0;
  int sumSeconds = 0;
  DurationBeat sumOfActivities =
      DurationBeat(hours: 0, minutes: 0, seconds: 0);
  List<Activity> allActivities =
      await activityService.getActivitiesByGoalID(goalID);

  if (allActivities.length == 0) {
    print("List empty");
  } else {
    for (int i = 0; i < allActivities.length; i++) {
      // add the hours, minutes, seconds
      sumHours += allActivities[i].activityDuration.hours!;
      sumMinutes += allActivities[i].activityDuration.minutes!;
      sumSeconds += allActivities[i].activityDuration.seconds!;
      print(allActivities[i]);
    }
  }
  print("sumHours: $sumHours");
  print("sumMinutes: $sumMinutes");
  print("sumSeconds: $sumSeconds");
  return allActivities;
}

Future<List<Goal>> getUsersLatestGoals(String userID) async {
  List<Goal> storage = List.empty(growable: true);
  Goal fitnessGoal = await goalService.getGoal(
      userID, CategoryTypes.FITNESS, null); // TemporalDate.now()
      //goalService.updateGoalCurrentDuration(fuelGoal.id);
  storage.add(fitnessGoal);
  Goal socialGoal =
      await goalService.getGoal(userID, CategoryTypes.SOCIAL, null);
  storage.add(socialGoal);
  Goal restGoal =
      await goalService.getGoal(userID, CategoryTypes.REST, null);
  storage.add(restGoal);
  Goal productivityGoal =
      await goalService.getGoal(userID, CategoryTypes.PRODUCTIVITY, null);
  storage.add(productivityGoal);
  Goal fuelGoal =
      await goalService.getGoal(userID, CategoryTypes.FUEL, null);
  storage.add(fuelGoal);
  return storage;
}

Future<void> updateCurrentDuration(String _goalID) async {
  await goalService.updateGoalCurrentDuration(_goalID);
}
