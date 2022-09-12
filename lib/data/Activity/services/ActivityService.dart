import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:beat/data/DateTimeService.dart';

import '../repository/ActivityRepository.dart';
import '../../../models/ModelProvider.dart';

class ActivityService {
  ActivityRepository activityRepository = ActivityRepository();

  Future<void> createActivity(String _localStart, TemporalDateTime _utcStart,
      CategoryTypes _category, DurationBeat _duration, String _goalId) async {
    final localTime = DateTime.now();
    final utc = TemporalDateTime(localTime);

    final activity = Activity(
        localStart: _localStart,
        utcStart: _utcStart,
        activityCategory: _category,
        activityDuration: _duration,
        activityMetrics: null,
        goalOfActivity: _goalId);

    await activityRepository.saveActivity(activity);
  }

  Future<Activity> getActivityRecord(String _activityMetric) async {
    return activityRepository.fetchActivityRecordById(_activityMetric);
  }

  Future<void> updateActivityCategory(
      CategoryTypes _newCategory, String _activityId) async {
    return activityRepository.updateActivityCategory(_newCategory, _activityId);
  }

  Future<void> updateActivityDuration(
      String _activityId, DurationBeat _newDuration) async {
    return activityRepository.updateActivityDuration(_activityId, _newDuration);
  }

  Future<List<Activity>> getActivitiesGoal(String _goalID) async {
    List<Activity> activities =
        await activityRepository.getAllActivitiesBelongingToGoal(_goalID);
    return activities;
  }

  Future<List<Activity>> getActivitiesByGoalID(String _goalID) async {
    List<Activity> activities =
        await activityRepository.getActivityByGoalID(_goalID);
    int size = activities.length;
    //print("Array Size: $size");
    return activities;
  }

  //Checks if the activity already exists in the database
  Future<bool> isDuplicate(String _goalID, String _local) {
    return activityRepository.doesExist(_goalID, _local);
  }

  Future<List<Activity>> fetchByAttribute(String? goalID, String? _local,
      TemporalDateTime? _utc, CategoryTypes? _category) {
    return Future.value([]);
    //TODO Implement!
  }
}
