import 'package:amplify_datastore/amplify_datastore.dart';

import '../repository/ActivityRepository.dart';
import '../../../models/ModelProvider.dart';

class ActivityService {
  ActivityRepository activityRepository = ActivityRepository();

  void createRecord(CategoryTypes _category, String _goalId, int _hours,
      int _minutes, int _seconds) {
    activityRepository.newActivityRecord(
        _category, _goalId, _hours, _minutes, _seconds);
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

  Future<TemporalDateTime> getActivityStart(String _activityId) async {
    Activity record = await getActivityRecord(_activityId);
    return record.activityStart;
  }

  Future<TemporalDateTime> getActivityEnd(String _activityId) async {
    Activity record = await getActivityRecord(_activityId);
    return record.activityEnd;
  }

  Future<CategoryTypes> getActivityCategory(String _activityId) async {
    Activity record = await getActivityRecord(_activityId);
    return record.activtyCategory;
  }

  Future<DurationBeat> getActivityDuration(String _activityId) async {
    Activity record = await getActivityRecord(_activityId);
    return record.activityDuration;
  }

  Future<String> getGoalId(String _activityId) async {
    Activity record = await getActivityRecord(_activityId);
    return record.goalID;
  }

  Future<String> getActivityId(String _activityId) async {
    Activity record = await getActivityRecord(_activityId);
    return record.id;
  }
}
