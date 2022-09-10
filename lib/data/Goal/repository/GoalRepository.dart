import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class GoalRepository {
  Future<void> saveGoal(Goal goal) async {
    await Amplify.DataStore.save(goal);
  }

  Future<void> deleteGoal(Goal goal) async {
    await Amplify.DataStore.delete(goal);
  }

  // Get goal by the goalID
  // UPDATE
  // need to pass in goal instead of creating goal in the repository
  Future<void> updateGoalPercentage(
      String _goalID, double newPercentage) async {
    Goal oldGoal = await fetchGoalByGoalID(_goalID);
    final newGoal = oldGoal.copyWith(goalPercentage: newPercentage);
    await Amplify.DataStore.save(newGoal);
  }

  // need to pass in goal instead of creating goal in the repository
  // UPDATE
  Future<void> updateGoalDurationPercentage(
      String _goalID, DurationBeat newDuration, newPercentage) async {
    Goal oldGoal = await fetchGoalByGoalID(_goalID);
    final newGoal = oldGoal.copyWith(
        goalPercentage: newPercentage, goalCurrentDuration: newDuration);
    await Amplify.DataStore.save(newGoal);
  }

  //SEARCHING
  //Getting the latest goal respective to the category.
  Future<Goal> fetchLatestGoal(CategoryTypes category, String userId) async {
    //Check if a record exist
    final record = await Amplify.DataStore.query(Goal.classType,
        where: Goal.USEROFGOAL.eq(userId).and(Goal.GOALCATEGORY.eq(category)),
        sortBy: [Goal.UTCDATE.descending()]);
    return record.first;
  }

  //Finds the goal whos start-end range hold the datetime
  //Assumes date is null
  Future<Goal> fetchGoalFromDate(
      CategoryTypes category, String userID, TemporalDate date) async {
    final goalList = await Amplify.DataStore.query(
      Goal.classType,
      where: Goal.USEROFGOAL.eq(userID).and(
            Goal.GOALCATEGORY.eq(category).and(
                  Goal.UTCDATE.eq(date),
                ),
          ),
    );
    return goalList.first;
  }

  //TODO User should have goals upon finishing sign up process. No need for null check
  Future<List<Goal>?> fetchAllUserGoals(String userID) async {
    final List<Goal> allUserGoals = await Amplify.DataStore.query(
        Goal.classType,
        where: Goal.USEROFGOAL.eq(userID));
    return allUserGoals.isEmpty ? null : allUserGoals;
  }

  Stream observeGoalChanges() {
    return Amplify.DataStore.observe(Goal.classType);
  }

  // get all activities for a specific goal
  Future<Goal> fetchGoalByGoalID(String goalId) async {
    final record = await Amplify.DataStore.query(Goal.classType,
        where: Goal.ID.eq(goalId));
    return record.first;
  }
}
