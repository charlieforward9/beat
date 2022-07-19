import 'package:amplify_datastore/amplify_datastore.dart';

import '../../../models/ModelProvider.dart';
import '../repository/GoalRepository.dart';

class GoalService {
  GoalRepository goalRepository = GoalRepository();

  void createGoal(
      CategoryTypes category, String userId, int hours, int minutes) {
    goalRepository.newGoalRecord(category, userId, hours, minutes);
  }

  Future<Goal> getGoalRecord(
      CategoryTypes category, String userId, DateTime date) {
    return goalRepository.getGoal(category, userId, date);
  }

  Future<double> getPercentage(
      CategoryTypes category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalPercentage!;
  }

  Future<DurationBeat> getCurrentDurationBeat(
      CategoryTypes category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalCurrentDuration;
  }

  Future<DurationBeat> getTargetDurationBeat(
      CategoryTypes category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalTargetDuration;
  }

  Future<CategoryTypes> getCategory(
      CategoryTypes category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalCategory;
  }

  Future<TemporalDateTime> getStart(
      CategoryTypes category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalStart;
  }

  Future<TemporalDateTime> getEnd(
      CategoryTypes category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalEnd;
  }

  // Future<String> getUserId(
  //     String category, String userId, DateTime date) async {
  //   Goal record = await getGoalRecord(category, userId, date);
  //   return record.userID;
  // }

  Future<String> getGoalId(
      CategoryTypes category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.id;
  }

  Future<void> updateGoalDuration(CategoryTypes category, String userId,
      DateTime date, DurationBeat duration) {
    return goalRepository.updateDuration(category, userId, date, duration);
  }
}
