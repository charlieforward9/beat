import 'dart:developer' as dev;
import 'dart:math';

import 'package:amplify_flutter/amplify_flutter.dart';

import '../../../data/Goal/services/GoalService.dart';
import 'package:beat/models/ModelProvider.dart';

import '../../User/services/UserService.dart';
import '../../../config/global.dart' as global;

class GoalServiceTest extends GoalService {
  late UserService userService;
  late String testUserID;
  final List<CategoryTypes> _allCategories = CategoryTypes.values;

  void createAndConfirmNewGoal(
      CategoryTypes category, DurationBeat newTargetDuration) async {
    String testUserID = global.currentUser.id;

    try {
      createGoal(category, target: newTargetDuration);
      await getGoal(testUserID, category, null).then(
        (value) => {
          dev.log("New goal created ${value.toString()}",
              time: DateTime.now(), name: 'GoalServiceTest createNewGoal')
        },
      );
    } catch (e) {
      dev.log(e.toString());
    }
  }

  void createAllPossibleGoalsWithRandomValues() async {
    //Create a goal for the user
    User user = global.currentUser;
    testUserID = user.id;

    for (var cat in _allCategories) {
      var randHour = Random().nextInt(3);
      var randMinute = Random().nextInt(30);
      var target =
          DurationBeat(hours: randHour, minutes: randMinute, seconds: 0);
      createAndConfirmNewGoal(cat, target);
    }
  }

  void logAllUserGoals() async {
    testUserID = global.currentUser.id;

    getAllGoals(testUserID, null).then((goals) => dev.log(
        "These are the goals ${goals.toString()}",
        name: "GoalServiceTest AllUserGoals"));
  }

  //Current
  void logOnlyLatestGoals() async {
    testUserID = global.currentUser.id;

    // get latest goal in each category
    for (var cat in _allCategories) {
      // when the timestamp is null, the latest goal is pulled
      getGoal(testUserID, cat, null).then((goals) => dev.log(
          "These are the latest goals: $goals",
          name: "GoalServiceTest LatestUserGoals"));
    }
  }

  Future<List<Goal>> futureLatestGoals() async {
    testUserID = global.currentUser.id;
    List<Future<Goal>> latestGoals = [];

    for (var cat in _allCategories) {
      latestGoals.add(getGoal(testUserID, cat, null));
    }

    return Future.wait(latestGoals);
  }

  Future<Goal> latestFitnessGoal() async {
    var data = Future.delayed(
        Duration(seconds: 2),
        () => {
              getGoal(global.currentUser.id, CategoryTypes.FITNESS,
                  TemporalDate.now()),
            });

    return data.then((value) => value.elementAt(0));
  }

  //TODO: WHY IS goalOfUser giving issues when set and no issues when null??????
}
