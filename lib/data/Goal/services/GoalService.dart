import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/controllers/time_budget_controller.dart';

import '../../../models/ModelProvider.dart';
import '../repository/GoalRepository.dart';

//Class which performs operations on
//GoalRepository.dart for more specific function.
//DO NOT IMPORT OTHER SCHEMAS' REPOS OR SERVICES
class GoalService {
  final GoalRepository _goalRepository = GoalRepository();

  //Assigns the current date as goalEnd on the latest goal (with a null goalEnd)
  //Creates a new goal instance with goalStart as current date and goalEnd=null
  Future<void> setNewGoal(String userID, CategoryTypes category,
      DurationBeat newTargetDuration) async {
    await _goalRepository.endGoal(userID, category);
    await _goalRepository.createGoal(userID, category, newTargetDuration);
  }

  Future<DurationBeat> getDurationOfAllGoalActivities(String goalID) async {
    int sumHours = 0;
    int sumMinutes = 0;
    int sumSeconds = 0;
    DurationBeat sumOfActivities =
        DurationBeat(durationHours: 0, durationMinutes: 0, durationSeconds: 0);
    List<Activity> allActivities =
        await activityService.getActivitiesByGoalID(goalID);

    if (allActivities.length == 0) {
      // print("List empty");
    } else {
      for (int i = 0; i < allActivities.length; i++) {
        // add the hours, minutes, seconds
        sumHours += allActivities[i].activityDuration.durationHours!;
        sumMinutes += allActivities[i].activityDuration.durationMinutes!;
        sumSeconds += allActivities[i].activityDuration.durationSeconds!;
        //print(allActivities[i]);
      }
    }
    // print("sumHours: $sumHours");
    // print("sumMinutes: $sumMinutes");
    // print("sumSeconds: $sumSeconds");

    return DurationBeat(
        durationHours: sumHours,
        durationMinutes: sumMinutes,
        durationSeconds: sumSeconds);
  }

  Future<void> updateGoalCurrentDuration(String _goalID) async {
    // _goalID = "015ad3d8-868b-4153-9cf5-f7c49a024582";
    DurationBeat _newCurrentDuration =
        await getDurationOfAllGoalActivities(_goalID);
    // get the old goal
    Goal oldGoal = await _goalRepository.fetchGoalByGoalID(_goalID);
    // sum old duration
    final oldDuration = Duration(
        hours: oldGoal.goalTargetDuration.durationHours!,
        minutes: oldGoal.goalTargetDuration.durationMinutes!,
        seconds: oldGoal.goalTargetDuration.durationSeconds!);
    final newDuration = Duration(
        hours: _newCurrentDuration.durationHours!,
        minutes: _newCurrentDuration.durationMinutes!,
        seconds: _newCurrentDuration.durationSeconds!);
    final newPercentage = (newDuration.inSeconds / oldDuration.inSeconds) * 100;
    // print("newPercentage - test: $newPercentage");
    // send to repo to update the goal
    await _goalRepository.updateGoalDurationPercentage(
        _goalID, _newCurrentDuration, newPercentage);
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

  //
  //
  //
  //
  //
  // INDIVIDUAL ATTRIBUTE GETTERS
  //
  //
  //
  //
  //
  // Future<double> getPercentage(
  //     CategoryTypes category, String userId, DateTime? date) async {
  //   final historicDate = date == null ? null : TemporalDateTime(date);
  //   Goal record = await getGoal(userId, category, historicDate);
  //   return record.goalPercentage!;
  // }

  // Future<DurationBeat> getCurrentDurationBeat(
  //     CategoryTypes category, String userId, DateTime? date) async {
  //   final historicDate = date == null ? null : TemporalDateTime(date);
  //   Goal record = await getGoal(userId, category, historicDate);
  //   return record.goalCurrentDuration;
  // }

  // Future<DurationBeat> getTargetDurationBeat(
  //     CategoryTypes category, String userId, DateTime? date) async {
  //   final historicDate = date == null ? null : TemporalDateTime(date);
  //   Goal record = await getGoal(userId, category, historicDate);
  //   return record.goalTargetDuration;
  // }

  // Future<CategoryTypes> getCategory(
  //     CategoryTypes category, String userId, DateTime? date) async {
  //   final historicDate = date == null ? null : TemporalDateTime(date);
  //   Goal record = await getGoal(userId, category, historicDate);
  //   return record.goalCategory;
  // }

  // Future<TemporalDateTime> getStart(
  //     CategoryTypes category, String userId, DateTime? date) async {
  //   final historicDate = date == null ? null : TemporalDateTime(date);
  //   Goal record = await getGoal(userId, category, historicDate);
  //   return record.goalStart;
  // }

  // Future<TemporalDateTime?> getEnd(
  //     CategoryTypes category, String userId, DateTime? date) async {
  //   final historicDate = date == null ? null : TemporalDateTime(date);
  //   Goal record = await getGoal(userId, category, historicDate);
  //   return record.goalEnd;
  // }

  // Future<String> getGoalId(
  //     CategoryTypes category, String userId, DateTime? date) async {
  //   final historicDate = date == null ? null : TemporalDateTime(date);
  //   Goal record = await getGoal(userId, category, historicDate);
  //   return record.id;
  // }
  //
  //
  //
  //
  //
  // INDIVIDUAL ATTRIBUTE GETTERS
  //
  //
  //
  //
  //
  // get list of corresponding activites given goal id

  Future<Goal> getGoalByGoalID(String goalID) async {
    Goal tempGoal = await _goalRepository.fetchGoalByGoalID(goalID);
    return tempGoal;
  }

  Future<Map<CategoryTypes, Goal>> getDailyGoals(String userID) async {
    TemporalDate now = TemporalDate(DateTime.utc(2022, 08, 19));
    //TemporalDate now = TemporalDate.now();
    Map<CategoryTypes, Goal> goals = {};
    goals[CategoryTypes.FITNESS] =
        await getGoal(userID, CategoryTypes.FITNESS, now);
    goals[CategoryTypes.REST] = await getGoal(userID, CategoryTypes.REST, now);
    goals[CategoryTypes.SOCIAL] =
        await getGoal(userID, CategoryTypes.SOCIAL, now);
    goals[CategoryTypes.FUEL] = await getGoal(userID, CategoryTypes.FUEL, now);
    goals[CategoryTypes.PRODUCTIVITY] =
        await getGoal(userID, CategoryTypes.PRODUCTIVITY, now);

    // goals[CategoryTypes.FITNESS] = await getGoal(userID, CategoryTypes.FITNESS,now);
    // goals[CategoryTypes.REST] = await getGoal(userID, CategoryTypes.REST,now);
    // goals[CategoryTypes.SOCIAL] = await getGoal(userID, CategoryTypes.SOCIAL,now);
    // goals[CategoryTypes.FUEL] = await getGoal(userID, CategoryTypes.FUEL,now);
    // goals[CategoryTypes.PRODUCTIVITY] = await getGoal(userID, CategoryTypes.PRODUCTIVITY,now);
    return goals;
  }

  Stream observeGoals() {
    return _goalRepository.observeGoalChanges();
    // .listen((_) => getDailyGoals(userID));
  }

  Future<List<Activity>> getAllGoalActivities(String goalID) async {
    Goal tempGoal = await _goalRepository.fetchGoalByGoalID(goalID);
    return tempGoal.goalActivities ?? [];
  }
}
