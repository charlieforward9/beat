import 'dart:developer' as dev;
import 'dart:math';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/data/Activity/services/ActivityService.dart';
import 'package:beat/data/DateTimeService.dart';
import 'package:beat/data/Goal/services/GoalService.dart';
import 'package:beat/global.dart' as global;
import 'package:beat/models/ModelProvider.dart';

class ActivityServiceTest {
  late String userID;

  late GoalService gService;
  late ActivityService aService;

  ActivityServiceTest() {
    userID = global.currentUser.id;

    gService = GoalService();
    aService = ActivityService();
  }

  Future<void> testActivityTimestamp() async {
    const category = CategoryTypes.FUEL;
    final goalDate = TemporalDate(DateTime(2022, 09, 02));
    dev.log(
        "Teting ${category.name} Activity Timestamp, check Database");
    gService
        .getGoal(userID, category, goalDate)
        .then((value) => aService.getActivitiesByGoalID(value.id))
        .then((value) => dev.log(
            "The local time is ${DateTime.parse(value.first.localStart.toString()).toLocal()}"));
  }

  Future<void> createAnActivityForEachGoal() async {
    final uid = global.currentUser.id;
    final randDur = Random().nextInt(50);
    final dur = DurationBeat(
        durationHours: randDur,
        durationMinutes: randDur,
        durationSeconds: randDur);
    for (CategoryTypes cat in CategoryTypes.values) {
      gService
          .getGoal(uid, cat, null)
          .then((goal) => Activity(
              localStart: DTService().localDT,
              utcStart: DTService().utcDT,
              activtyCategory: cat,
              activityDuration: dur,
              howToGetG: goal.id))
          .then(((activity) =>
              {createAndConfirmActivity(activity)}));
    }
  }

  Future<void> createAndConfirmActivity(Activity activity) async {
    await aService
        .createActivity(activity.localStart, activity.utcStart, activity.activtyCategory,
            activity.activityDuration, activity.howToGetG)
        .then((_) => aService.getActivitiesByGoalID(activity.howToGetG))
        .then((value) => dev.log(value.first.toString()));
  }
}