import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../../../models/ModelProvider.dart';

class ActivityRepository {
  DateTime now = DateTime.now();
  Duration durationclass = Duration();

  Future<void> saveActivity(Activity activity) async {
    await Amplify.DataStore.save(activity);
  }

  Future<Activity> fetchActivityRecordById(String _activityId) async {
    final activityRecord = await Amplify.DataStore.query(
      Activity.classType,
      where: Activity.ID.eq(_activityId),
    );
    return activityRecord.first;
    // call and return index 0 [0]
  }

  Future<void> updateActivityCategory(Activity _activity) async {
    await Amplify.DataStore.save(_activity);
  }

  Future<void> updateActivityDuration(Activity _activity) async {
    await Amplify.DataStore.save(_activity);
  }

  Future<List<Activity>> getAllActivitiesBelongingToGoal(String goalID) async {
    final activities = await Amplify.DataStore.query(Activity.classType,
        where: Activity.GOALOFACTIVITY.eq(goalID));
    return activities;
  }

  Future<List<Activity>> getActivityByGoalID(String goalID) async {
    final activities = await Amplify.DataStore.query(Activity.classType,
        where: Activity.GOALOFACTIVITY.eq(goalID));
    return activities;
  }

  Stream observeActivityChanges() {
    return Amplify.DataStore.observe(Activity.classType);
  }
}
