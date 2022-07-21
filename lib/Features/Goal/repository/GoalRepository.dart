import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class GoalRepository {
  DateTime now = DateTime.now();
  Duration durationclass = Duration();

  Future<void> newGoalRecord(CategoryTypes category, String userId, int _hours,
      int _minutes, int _seconds) async {
    final newGoal = Goal(
        goalStart: TemporalDateTime(DateTime(now.year, now.month, now.day)),
        goalEnd: TemporalDateTime(DateTime(now.year, now.month, now.day)),
        goalCategory: category,
        goalCurrentDuration: DurationBeat(
            durationHours: 0, durationMinutes: 0, durationSeconds: 0),
        goalTargetDuration: DurationBeat(
            durationHours: _hours,
            durationMinutes: _minutes,
            durationSeconds: _seconds),
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

  Future<Goal> getGoalOnID(String goalId) async {
    final record = await Amplify.DataStore.query(Goal.classType,
        where: Goal.ID.eq(goalId));
    return record.first;
  }

  Future<void> updateDuration(CategoryTypes category, String userId,
      DateTime now, DurationBeat duration) async {
    Goal oldRecord =
        await getGoal(category, "985924ea-f60a-4deb-89d9-ad6c71fec5c6", now);
    print(oldRecord);
    final newRecordPercenatge = oldRecord.copyWith(
      id: "5726da1e-63ba-45f8-92ce-0e4baff04712",
      goalCurrentDuration: DurationBeat(
          durationHours: 1000,
          durationMinutes: 9999,
          durationSeconds: 6969696969),
      goalPercentage:
          69.696969696, //(current.inSeconds * 100) / target.inSeconds,
    );
    print(newRecordPercenatge);
    await Amplify.DataStore.save(newRecordPercenatge);
  }

  Future<void> updateDurationOnGoalId(
      String goalId, DurationBeat duration) async {
    Goal oldRecord = await getGoalOnID(goalId);
    DurationBeat targetBeat = oldRecord.goalTargetDuration;
    Duration target =
        Duration(hours: targetBeat.durationHours!, minutes: 0, seconds: 0);
    Duration current = Duration(
        hours: duration.durationHours!,
        minutes: duration.durationMinutes!,
        seconds: duration.durationSeconds!);
    final newRecordPercenatge = oldRecord.copyWith(
      id: oldRecord.id,
      goalCurrentDuration: duration,
      goalPercentage: (current.inSeconds * 100) / target.inSeconds,
    );
    print(newRecordPercenatge.goalCurrentDuration);
    print(newRecordPercenatge.goalPercentage);
    await Amplify.DataStore.save(newRecordPercenatge);
  }
}
