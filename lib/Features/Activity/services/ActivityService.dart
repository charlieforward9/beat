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

  Future<Activity> getActivityRecord(
      CategoryTypes _category, String _goalId, DateTime _now) async {
    return activityRepository.getActivityRecordById(_category, _goalId, _now);
  }

  Future<void> updateActivityCategory(
      CategoryTypes _category, String _goalId, DateTime _now) async {
    return activityRepository.updateActivityCategory(_category, _goalId, _now);
  }

  Future<void> updateActivityDuration(CategoryTypes _category, String _goalId,
      DateTime _now, DurationBeat _duration) async {
    return activityRepository.updateActivityDuration(
        _category, _goalId, _now, _duration);
  }

  Future<TemporalDateTime> getActivityStart(
      CategoryTypes _category, String _goalId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, _goalId, _now);
    return record.activityStart;
  }

  Future<TemporalDateTime> getActivityEnd(
      CategoryTypes _category, String _goalId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, _goalId, _now);
    return record.activityEnd;
  }

  Future<CategoryTypes> getActivityCategory(
      CategoryTypes _category, String _goalId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, _goalId, _now);
    return record.activtyCategory;
  }

  Future<DurationBeat> getActivityDuration(
      CategoryTypes _category, String _goalId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, _goalId, _now);
    return record.activityDuration;
  }

  Future<String> getGoalId(
      CategoryTypes _category, String _goalId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, _goalId, _now);
    return record.goalID;
  }

  Future<String> getActivityId(
      CategoryTypes _category, String _goalId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, _goalId, _now);
    return record.id;
  }
}
