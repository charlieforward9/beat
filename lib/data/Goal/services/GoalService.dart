import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/controllers/time_budget_controller.dart';
import 'package:beat/data/DateTimeService.dart';
import 'package:beat/data/User/repository/UserRepository.dart';
import 'package:beat/data/User/services/UserService.dart';

import '../../../models/ModelProvider.dart';
import '../repository/GoalRepository.dart';

//Class which performs operations on
//GoalRepository.dart for more specific function.
//DO NOT IMPORT OTHER SCHEMAS' REPOS OR SERVICES
class GoalService {
  final UserService _userService = UserService();
  final GoalRepository _goalRepository = GoalRepository();

  //Creates a goal and returns the instance
  //NOTE: It is not necessary to use the instance
  Future<Goal> createGoal(String userID, CategoryTypes category,
      DurationBeat targetDuration) async {
    DTService DTS = DTService();
    final Goal goal = Goal(
        userOfGoal: userID,
        goalCategory: category,
        goalTargetDuration: targetDuration,
        goalCurrentDuration: DurationBeat(hours: 0, minutes: 0, seconds: 0),
        goalPercentage: 0,
        localDate: DTS.localD,
        utcDate: DTS.utcD);
    await _goalRepository.saveGoal(goal);
    return goal;
    //await _userService.saveGoalToUser(goal);
  }

  Future<DurationBeat> getDurationOfAllGoalActivities(String goalID) async {
    int sumHours = 0;
    int sumMinutes = 0;
    int sumSeconds = 0;
    DurationBeat sumOfActivities =
        DurationBeat(hours: 0, minutes: 0, seconds: 0);
    List<Activity> allActivities =
        await activityService.getActivitiesByGoalID(goalID);

    if (allActivities.length == 0) {
      // print("List empty");
    } else {
      for (int i = 0; i < allActivities.length; i++) {
        // add the hours, minutes, seconds
        sumHours += allActivities[i].activityDuration.hours!;
        sumMinutes += allActivities[i].activityDuration.minutes!;
        sumSeconds += allActivities[i].activityDuration.seconds!;
      }
    }

    return DurationBeat(
        hours: sumHours, minutes: sumMinutes, seconds: sumSeconds);
  }

  Future<void> updateGoalCurrentDuration(String _goalID) async {
    DurationBeat _newCurrentDuration =
        await getDurationOfAllGoalActivities(_goalID);
    // get the old goal
    Goal oldGoal = await _goalRepository.fetchGoalByGoalID(_goalID);
    // sum old duration
    final oldDuration = Duration(
        hours: oldGoal.goalTargetDuration.hours!,
        minutes: oldGoal.goalTargetDuration.minutes!,
        seconds: oldGoal.goalTargetDuration.seconds!);
    final newDuration = Duration(
        hours: _newCurrentDuration.hours!,
        minutes: _newCurrentDuration.minutes!,
        seconds: _newCurrentDuration.seconds!);
    final newPercentage = (newDuration.inSeconds / oldDuration.inSeconds) * 100;
    // need to pass in goal instead of creating goal in the repository
    // print("NEW DURATION: $newDuration");
    oldGoal = await _goalRepository.fetchGoalByGoalID(_goalID);
    final newGoal = oldGoal.copyWith(
        goalPercentage: newPercentage,
        goalCurrentDuration: DurationBeat(
            hours: _newCurrentDuration.hours!,
            minutes: _newCurrentDuration.minutes!,
            seconds: _newCurrentDuration.seconds!));
    await _goalRepository.updateGoal(newGoal);
  }

  Future<void> updateGoalTargettDuration(
      String _goalID, int hours, int minutes) async {
    DurationBeat newTargetDuration =
        DurationBeat(hours: hours, minutes: minutes);
    // get the old goal
    Goal oldGoal = await _goalRepository.fetchGoalByGoalID(_goalID);
    // sum old duration
    final currentDuration = Duration(
        hours: oldGoal.goalCurrentDuration.hours!,
        minutes: oldGoal.goalCurrentDuration.minutes!,
        seconds: oldGoal.goalCurrentDuration.seconds!);
    final newGoalDuration = Duration(
        hours: newTargetDuration.hours!, minutes: newTargetDuration.minutes!);
    // get the current duration / newGoalDuration
    final newPercentage =
        (currentDuration.inSeconds / newGoalDuration.inSeconds) * 100;
    // need to pass in goal instead of creating goal in the repository
    // print("NEW DURATION: $newDuration");
    oldGoal = await _goalRepository.fetchGoalByGoalID(_goalID);
    final newGoal = oldGoal.copyWith(
        goalPercentage: newPercentage,
        goalTargetDuration: DurationBeat(
            hours: newTargetDuration.hours!,
            minutes: newTargetDuration.minutes!));
    await _goalRepository.updateGoal(newGoal);
  }

  //Returns the requested goal based on its category and date
  //If date is null, it returns the current goal
  //If date specified, it finds the goal whose goalStart and goalEnd range holds this date
  Future<Goal> getGoal(
      String userID, CategoryTypes category, TemporalDate? date) {
    return date == null
        ? _goalRepository.fetchLatestGoal(category, userID)
        : _goalRepository.fetchGoalFromDate(category, userID, date);
  }

  //Null category type means all categories
  //Null return value means the user has no goals yet
  //TODO User should have goals once signed. This should never return null when a user account is set up
  Future<List<Goal>?> getAllGoals(
      String userID, CategoryTypes? category) async {
    List<Goal>? allUserGoals = await _goalRepository.fetchAllUserGoals(userID);

    return category == null
        ? allUserGoals?.toList()
        : allUserGoals!
            .where((element) => element.goalCategory == category)
            .toList();
  }

  //Should only be used when a user deletes their account
  Future<void> deleteAllUserGoals(String userID) async {
    List<Goal>? allUserGoals = await _goalRepository.fetchAllUserGoals(userID);
    if (allUserGoals != null) {
      for (Goal goal in allUserGoals) {
        await _goalRepository.deleteGoal(goal);
      }
    }
  }

  // get list of corresponding activites given goal id

  Future<Goal> getGoalByGoalID(String goalID) async {
    Goal tempGoal = await _goalRepository.fetchGoalByGoalID(goalID);
    return tempGoal;
  }

  Future<Map<CategoryTypes, Goal>> getLatestGoals(String userID) async {
    Map<CategoryTypes, Goal> goals = {};
    goals[CategoryTypes.FITNESS] =
        await getGoal(userID, CategoryTypes.FITNESS, null);
    goals[CategoryTypes.REST] = await getGoal(userID, CategoryTypes.REST, null);
    goals[CategoryTypes.SOCIAL] =
        await getGoal(userID, CategoryTypes.SOCIAL, null);
    goals[CategoryTypes.FUEL] = await getGoal(userID, CategoryTypes.FUEL, null);
    goals[CategoryTypes.PRODUCTIVITY] =
        await getGoal(userID, CategoryTypes.PRODUCTIVITY, null);
    return goals;
  }

  Stream observeGoals() {
    return _goalRepository.observeGoalChanges();
  }

  Future<List<Activity>> getAllGoalActivities(String goalID) async {
    Goal tempGoal = await _goalRepository.fetchGoalByGoalID(goalID);
    return tempGoal.goalActivities ?? [];
  }
}
