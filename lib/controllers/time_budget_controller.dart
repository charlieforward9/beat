//IMPORT STATEMENT SHOULD LOOK LIKE THIS
//import '<PATH>' as controller;
import 'dart:developer';

// import data models
import '../models/ModelProvider.dart';

// service imports
import '../data/Activity/services/ActivityService.dart';
import '../data/Goal/services/GoalService.dart';
import '../data/Metrics/repository/MetricRepository.dart';

// testing global
import '../global.dart' as globalTest;

//TODO: Add functions

// make repository for all services
ActivityService activityService = ActivityService();
GoalService goalService = GoalService();
MetricRepository metricService = MetricRepository();

/*
  Things to add
  - get specific user goal
  - get specific user percentage
  - update specific user goal
  - update specific user percentage


*/

void _updatedSpecificGoal(_cardName, _goal, _progress) async {
  if (_cardName == "Recovery") {
    log(globalTest.currentUser.toString());
  }
}

// void controllerTester(_goalType, _goal, _progress) {
//   print("Goal Type: $_goalType");
//   print("Goal: $_goal");
//   print("Progress: $_progress");
// }

// String getGoal(_category, _time) async {
//   @override
//   String userID = globalTest.currentUser.id;
//   CategoryTypes tmp = CategoryTypes.FITNESS;
//   Future<Goal> tempGoal = goalService.getGoal(userID, tmp, _time);
//   // goalService.getGoal(userID, tmp, _time).then((value) {
//   //   //print("Goal:");
//   // });

//   // need userID, category, dateTime,
//   //print("UserID: $userID");
//   // if (_category == "Fitness") {
//   //   // DurationBeat temp = DurationBeat.now();
//   // }
//   return tempGoal.id;
// }
