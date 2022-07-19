import 'package:amplify_flutter/amplify_flutter.dart';
import '../../../models/ModelProvider.dart';

class ActivityRepository {
  DateTime now = DateTime.now();
  Duration durationclass = Duration();
  Future<void> newActivityRecord(String _category, String userId, int _hours,
      int _minutes, int _seconds) async {
    final newActivity = Activity(
      activityStart:
          TemporalDateTime(DateTime(now.year, now.month, now.day, 0, 0, 0, 0)),
      activityEnd: TemporalDateTime(
          DateTime(now.year, now.month, now.day, 23, 59, 59, 59)),
      activtyCategory: _category, // 'Fitness',
      activityDuration: DurationBeat(
          durationHours: _hours,
          durationMinutes: _minutes,
          durationSeconds: _seconds), //DurationBeat(durationHours: 2),
      goalID: userId,
    );
    await Amplify.DataStore.save(newActivity);
  }

  Future<Activity> getActivityRecordById(
      String _category, String userId, DateTime _now) async {
    final activityRecord = await Amplify.DataStore.query(
      Activity.classType,
      where: Activity.ID
          .eq(userId)
          .and(Activity.ACTIVTYCATEGORY.eq(_category))
          .and(Activity.ACTIVITYSTART.lt(now))
          .and(Activity.ACTIVITYSTART.gt(now)),
    );
    return activityRecord.first;
    // call and return index 0 [0]
  }

  Future<void> updateActivityCategory(
      String _category, String userId, DateTime _now) async {
    // TODO: this may return the oldest element if you have more than one element
    Activity oldActivity =
        (await getActivityRecordById(_category, userId, _now));
    final newActivity =
        oldActivity.copyWith(id: oldActivity.id, activtyCategory: _category);
    await Amplify.DataStore.save(newActivity);
  }

  Future<void> updateActivityDuration(String _category, String userId,
      DateTime _now, DurationBeat _duration) async {
    Activity oldActivity =
        (await getActivityRecordById(_category, userId, _now));
    final newActivity = oldActivity.copyWith(
        id: oldActivity.id,
        activtyCategory: _category,
        activityDuration: _duration);
    await Amplify.DataStore.save(newActivity);
  }
}
