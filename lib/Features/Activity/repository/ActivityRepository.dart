import 'package:amplify_flutter/amplify_flutter.dart';
import '../../../models/ModelProvider.dart';

class ActivityRepository {
  DateTime now = DateTime.now();
  Duration durationclass = Duration();

  Future<void> newActivityRecord(String _category, String _goalId, int _hours,
      int _minutes, int _seconds) async {
    final newActivity = Activity(
      activityStart: TemporalDateTime.fromString("2022-07-17T18:18:13.683Z"),
      activityEnd: TemporalDateTime.fromString("2022-07-17T18:18:13.683Z"),
      activtyCategory: _category, // 'Fitness',
      activityDuration: DurationBeat(
          durationHours: 0,
          durationMinutes: 0,
          durationSeconds: 0), //DurationBeat(durationHours: 2),
      goalID: _goalId,
    );
    await Amplify.DataStore.save(newActivity);
    // TODO: Activities Stored in AmplifyDataStore not in Activity ??? Maybe ok.
  }

  Future<Activity> getActivityRecordById(
      String _category, String _goalId, DateTime _now) async {
    final activityRecord = await Amplify.DataStore.query(
      Activity.classType,
      where: Activity.ID
          .eq(_goalId)
          .and(Activity.ACTIVTYCATEGORY.eq(_category))
          .and(Activity.ACTIVITYSTART.lt(now))
          .and(Activity.ACTIVITYSTART.gt(now)),
    );
    return activityRecord.first;
    // call and return index 0 [0]
  }

  Future<void> updateActivityCategory(
      String _category, String _goalId, DateTime _now) async {
    // TODO: this may return the oldest element if you have more than one element
    Activity oldActivity =
        (await getActivityRecordById(_category, _goalId, _now));
    final newActivity =
        oldActivity.copyWith(id: oldActivity.id, activtyCategory: _category);
    await Amplify.DataStore.save(newActivity);
  }

  Future<void> updateActivityDuration(String _category, String _goalId,
      DateTime _now, DurationBeat _duration) async {
    Activity oldActivity =
        (await getActivityRecordById(_category, _goalId, _now));
    final newActivity = oldActivity.copyWith(
        id: oldActivity.id,
        activtyCategory: _category,
        activityDuration: _duration);
    await Amplify.DataStore.save(newActivity);
  }
}
