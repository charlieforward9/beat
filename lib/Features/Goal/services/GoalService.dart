import 'package:amplify_datastore/amplify_datastore.dart';

import '../../../models/ModelProvider.dart';
import '../repository/GoalRepository.dart';

class GoalService {
  GoalRepository goalRepository = GoalRepository();

  void createGoal(String category, String userId, int hours, int minutes) {
    goalRepository.newGoalRecord(category, userId, hours, minutes);
  }

  Future<Goal> getGoalRecord(String category, String userId, DateTime date) {
    return goalRepository.getGoal(category, userId, date);
  }

  Future<double> getPercentage(
      String category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalPercentage!;
  }

  Future<DurationBeat> getCurrentDurationBeat(
      String category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalCurrentDuration;
  }

  Future<DurationBeat> getTargetDurationBeat(
      String category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalTargetDuration;
  }

  Future<String> getCategory(
      String category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalCategory;
  }

  Future<TemporalDateTime> getStart(
      String category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalStart;
  }

  Future<TemporalDateTime> getEnd(
      String category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.goalEnd;
  }

  // Future<String> getUserId(
  //     String category, String userId, DateTime date) async {
  //   Goal record = await getGoalRecord(category, userId, date);
  //   return record.userID;
  // }

  Future<String> getGoalId(
      String category, String userId, DateTime date) async {
    Goal record = await getGoalRecord(category, userId, date);
    return record.id;
  }

  Future<void> updateGoalDuration(
      String category, String userId, DateTime date, DurationBeat duration) {
    return goalRepository.updateDuration(category, userId, date, duration);
  }
}
