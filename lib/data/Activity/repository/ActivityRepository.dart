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

  Future<void> updateActivityCategory(
      CategoryTypes _newCategory, String _activityId) async {
    Activity oldActivity = (await fetchActivityRecordById(_activityId));
    final newActivity = oldActivity.copyWith(
        id: oldActivity.id, activityCategory: _newCategory);
    await Amplify.DataStore.save(newActivity);
  }

  Future<void> updateActivityDuration(
      String _activityId, DurationBeat _newDuration) async {
    Activity oldActivity = (await fetchActivityRecordById(_activityId));
    final newActivity = oldActivity.copyWith(
        id: oldActivity.id,
        activityCategory: oldActivity.activityCategory,
        activityDuration: _newDuration);
    await Amplify.DataStore.save(newActivity);
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

  Future<bool> doesExist(String _goalID, String? _local) async {
    return Amplify.DataStore.query(Activity.classType,
            where: Activity.GOALOFACTIVITY
                .eq(_goalID)
                .and(Activity.LOCALSTART.eq(_local)))
        .then((activites) => activites.isNotEmpty);
  }
}
