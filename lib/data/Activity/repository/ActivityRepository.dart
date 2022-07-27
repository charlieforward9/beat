import 'package:amplify_flutter/amplify_flutter.dart';
import '../../../models/ModelProvider.dart';

class ActivityRepository {
  DateTime now = DateTime.now();
  Duration durationclass = Duration();

  Future<void> newActivityRecord(CategoryTypes _category, String _goalId,
      int _hours, int _minutes, int _seconds) async {
    final newActivity = Activity(
      activityStart: TemporalDateTime.fromString("2022-07-17T18:18:13.683Z"),
      activityEnd: TemporalDateTime.fromString("2022-07-17T18:18:13.683Z"),
      activtyCategory: _category, // 'Fitness',
      activityDuration: DurationBeat(
          durationHours: _hours,
          durationMinutes: _minutes,
          durationSeconds: _seconds), //DurationBeat(durationHours: 2),
      goalID: _goalId,
    );
    await Amplify.DataStore.save(newActivity);
    // TODO: Activities Stored in AmplifyDataStore not in Activity ??? Maybe ok.
  }

  Future<Activity> fetchActivityRecordById(String _activityId) async {
    final activityRecord = await Amplify.DataStore.query(
      Activity.classType,
      where: Activity.ID.eq(_activityId),
    );
    return activityRecord.first;
    // call and return index 0 [0]
  }

  Future<void> updateActivityCategory(
      CategoryTypes _newCategory, String _activityId) async {
    Activity oldActivity = (await fetchActivityRecordById(_activityId));
    final newActivity =
        oldActivity.copyWith(id: oldActivity.id, activtyCategory: _newCategory);
    await Amplify.DataStore.save(newActivity);
  }

  Future<void> updateActivityDuration(
      String _activityId, DurationBeat _newDuration) async {
    Activity oldActivity = (await fetchActivityRecordById(_activityId));
    final newActivity = oldActivity.copyWith(
        id: oldActivity.id,
        activtyCategory: oldActivity.activtyCategory,
        activityDuration: _newDuration);
    await Amplify.DataStore.save(newActivity);
  }
}
