import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class GoalRepository {
  Future<void> saveGoal(Goal goal) async {
    await Amplify.DataStore.save(goal);
  }

  Future<void> deleteGoal(Goal goal) async {
    await Amplify.DataStore.delete(goal);
  }

  //SEARCHING
  //Getting the latest goal respective to the category.
  Future<Goal> fetchLatestGoal(CategoryTypes category, String userId) async {
    //Check if a record exist
    final record = await Amplify.DataStore.query(Goal.classType,
        where: Goal.HOWTOGETU.eq(userId).and(Goal.GOALCATEGORY.eq(category)),
        sortBy: [Goal.UTCDATE.descending()]);
    return record.first;
  }

  //Finds the goal whos start-end range hold the datetime
  //Assumes date is null
  Future<Goal> fetchGoalFromDate(
      CategoryTypes category, String userID, TemporalDate date) async {
    final goalList = await Amplify.DataStore.query(Goal.classType,
        where: Goal.HOWTOGETU
            .eq(userID)
            .and(Goal.GOALCATEGORY.eq(category).and(Goal.UTCDATE.eq(date))),
        sortBy: [Goal.UTCDATE.descending()]);
    return goalList.first;
  }

  //TODO User should have goals upon finishing sign up process. No need for null check
  Future<List<Goal>?> fetchAllUserGoals(String userID) async {
    final List<Goal> allUserGoals = await Amplify.DataStore.query(
        Goal.classType,
        where: Goal.HOWTOGETU.eq(userID));
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
