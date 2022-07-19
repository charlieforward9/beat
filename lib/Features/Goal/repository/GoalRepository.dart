import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class GoalRepository {
  DateTime now = DateTime.now();
  Duration durationclass = Duration();

  Future<void> newGoalRecord(
      CategoryTypes category, String userId, int _hours, int _minutes) async {
    final newGoal = Goal(
        goalStart: TemporalDateTime(DateTime(now.year, now.month, now.day)),
        goalEnd: TemporalDateTime(DateTime(now.year, now.month, now.day)),
        goalCategory: category,
        goalCurrentDuration: DurationBeat(
            durationHours: 0, durationMinutes: 0, durationSeconds: 0),
        goalTargetDuration:
            DurationBeat(durationHours: _hours, durationMinutes: 0),
        goalPercentage: 0,
        userID: userId);
    await Amplify.DataStore.save(newGoal);
  }
  // TODO: Create new goal every day from previous goal, unless goal is modified.

  Future<Goal> getGoal(
      CategoryTypes category, String userId, DateTime now) async {
    final record = await Amplify.DataStore.query(Goal.classType,
        where: Goal.USERID
            .eq(userId)
            .and(Goal.GOALCATEGORY.eq(category))
            .and(Goal.GOALSTART.lt(TemporalDateTime(now))));
    return record.first;
  }

  Future<void> updateDuration(CategoryTypes category, String userId,
      DateTime now, DurationBeat duration) async {
    Goal oldRecord = await getGoal(category, userId, now);
    DurationBeat targetBeat = oldRecord.goalTargetDuration;
    Duration target = Duration(
        hours: targetBeat.durationHours!,
        minutes: targetBeat.durationMinutes!,
        seconds: targetBeat.durationSeconds!);
    Duration current = Duration(
        hours: duration.durationHours!,
        minutes: duration.durationMinutes!,
        seconds: duration.durationSeconds!);
    final newRecordPercenatge = oldRecord.copyWith(
      id: oldRecord.id,
      goalCurrentDuration: duration,
      goalPercentage: (current.inSeconds * 100) / target.inSeconds,
    );
    await Amplify.DataStore.save(newRecordPercenatge);
  }
}
