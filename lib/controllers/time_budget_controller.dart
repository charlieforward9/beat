//IMPORT STATEMENT SHOULD LOOK LIKE THIS
//import '<PATH>' as TimeBudgetController;
import 'dart:developer';

import 'dart:math';

// import data models
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:beat/data/Goal/repository/GoalRepository.dart';
import 'package:flutter/cupertino.dart';

import '../models/ModelProvider.dart';

// service imports
import '../data/Activity/services/ActivityService.dart';
import '../data/Goal/services/GoalService.dart';
import '../data/Metrics/repository/MetricRepository.dart';
import '../data/User/services/UserService.dart';

// testing global
import '../global.dart' as globalTest;

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

Future<void> createActivity() async {
  debugPrint("Creating Activity....");
  Random random = new Random();
  int randomNumber1 = random.nextInt(100);
  activityService.createRecord(
      CategoryTypes.FITNESS,
      "f49cf805-6ada-4731-87a6-8b1fb027660c",
      randomNumber1,
      randomNumber1,
      randomNumber1);
}

Future<List<Goal>> getUsersLatestGoals(String userID) async {
  TemporalDate tempDate = TemporalDate(DateTime.utc(2022, 08, 19));
  List<Goal> storage = List.empty(growable: true);
  Goal fitnessGoal = await goalService.getGoal(
      userID, CategoryTypes.FITNESS, tempDate); // TemporalDate.now()
  // goalService.updateGoalCurrentDuration(fitnessGoal.id);
  storage.add(fitnessGoal);
  Goal socialGoal =
      await goalService.getGoal(userID, CategoryTypes.SOCIAL, tempDate);
  goalService.updateGoalCurrentDuration(socialGoal.id);
  storage.add(socialGoal);
  Goal restGoal =
      await goalService.getGoal(userID, CategoryTypes.REST, tempDate);
  //goalService.updateGoalCurrentDuration(restGoal.id);
  storage.add(restGoal);
  Goal productivityGoal =
      await goalService.getGoal(userID, CategoryTypes.PRODUCTIVITY, tempDate);
  //goalService.updateGoalCurrentDuration(productivityGoal.id);
  storage.add(productivityGoal);
  Goal fuelGoal =
      await goalService.getGoal(userID, CategoryTypes.FUEL, tempDate);
  //goalService.updateGoalCurrentDuration(fuelGoal.id);
  storage.add(fuelGoal);
  return storage;
}

Future<void> updateCurrentDuration(String _goalID) async {
  await goalService.updateGoalCurrentDuration(_goalID);
}
