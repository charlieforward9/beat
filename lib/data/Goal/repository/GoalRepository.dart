import 'dart:developer';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class GoalRepository {
  //Helper Variables
  final TemporalDateTime _today = TemporalDateTime(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  //Helper Functions
  Future<bool> _previousGoalExists(String userID, CategoryTypes cat) async {
    final goalList = await Amplify.DataStore.query(Goal.classType,
        where: Goal.USERID.eq(userID).and(Goal.GOALCATEGORY.eq(cat)));
    return goalList.isNotEmpty;
  }


  //INSERTION
  Future<void> createGoal(String userID, CategoryTypes category,
      DurationBeat targetDuration) async {
    final Goal goal = Goal(
        userID: userID,
        goalCategory: category,
        goalTargetDuration: targetDuration,
        goalCurrentDuration: DurationBeat(
            durationHours: 0, durationMinutes: 0, durationSeconds: 0),
        goalPercentage: 0,
        goalStart: _today,
        goalEnd: null); //Null when the goal is current.
    await Amplify.DataStore.save(goal);
  }

  //Sets the goalEnd attribute to current day. If the goal doesnt exist, does nothing.
  Future<void> endGoal(String userID, CategoryTypes category) async {
    if (await _previousGoalExists(userID, category)) {
      Goal currGoal = (await getLatestGoal(category, userID));
      await Amplify.DataStore.save(currGoal.copyWith(goalEnd: _today));
    } else {
      log("Cannot end a goal that does not exist, try creating a goal first");
    }
  }

  //DELETION (LOST USER)
  Future<void> deleteGoal(Goal goal) async {
    await Amplify.DataStore.delete(goal);
  }


  //SEARCHING
  //Getting the latest goal respective to the category.
  Future<Goal> getLatestGoal(CategoryTypes category, String userId) async {
    //Check if a record exist
    final record = await Amplify.DataStore.query(Goal.classType,
        where: Goal.USERID
            .eq(userId)
            .and(Goal.GOALCATEGORY.eq(category))
            .and(Goal.GOALEND.eq(null)),
        sortBy: [Goal.GOALEND.ascending()]);
    return record.first;
  }

  //Finds the goal whos start-end range hold the datetime 
  Future<Goal> getGoalFromDate(
      CategoryTypes category, String userID, TemporalDateTime? datetime) async {
    late final Goal goal;
    if (datetime != null) {
      final goalList = await Amplify.DataStore.query(Goal.classType,
          where: Goal.USERID.eq(userID).and(Goal.GOALCATEGORY
              .eq(category)
              .and(Goal.GOALSTART.le(datetime).and(Goal.GOALEND.ge(datetime)))),
          sortBy: [Goal.GOALEND.ascending()]);
      goal = goalList.first;
      ;
    } else {
      goal = await getLatestGoal(category, userID);
    }
    return goal;
  }

  //TODO User should have goals upon finishing sign up process. No need for null check
  Future<List<Goal>?> getAllUserGoals(String userID) async {
    final List<Goal> allUserGoals = await Amplify.DataStore.query(
        Goal.classType,
        where: Goal.USERID.eq(userID));
    return allUserGoals.isEmpty ? null : allUserGoals;
  }
}
