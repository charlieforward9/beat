import 'package:amplify_datastore/amplify_datastore.dart';

import '../repository/ActivityRepository.dart';
import '../../../models/ModelProvider.dart';

class ActivityService {
  ActivityRepository activityRepository = ActivityRepository();

  void createRecord(
      String _category, String userID, int _hours, int _minutes, int _seconds) {
    activityRepository.newActivityRecord(
        userID, _category, _hours, _minutes, _seconds);
  }

  Future<Activity> getActivityRecord(
      String _category, String userId, DateTime _now) async {
    return activityRepository.getActivityRecordById(_category, userId, _now);
  }

  Future<void> updateActivityCategory(
      String _category, String userId, DateTime _now) async {
    return activityRepository.updateActivityCategory(_category, userId, _now);
  }

  Future<void> updateActivityDuration(String _category, String userId,
      DateTime _now, DurationBeat _duration) async {
    return activityRepository.updateActivityDuration(
        _category, userId, _now, _duration);
  }

  Future<TemporalDateTime> getActivityStart(
      String _category, String userId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, userId, _now);
    return record.activityStart;
  }

  Future<TemporalDateTime> getActivityEnd(
      String _category, String userId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, userId, _now);
    return record.activityEnd;
  }

  Future<String> getActivityCategory(
      String _category, String userId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, userId, _now);
    return record.activtyCategory;
  }

  Future<DurationBeat> getActivityDuration(
      String _category, String userId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, userId, _now);
    return record.activityDuration;
  }

  Future<String> getGoalId(
      String _category, String userId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, userId, _now);
    return record.goalID;
  }

  Future<String> getActivityId(
      String _category, String userId, DateTime _now) async {
    Activity record = await getActivityRecord(_category, userId, _now);
    return record.id;
  }
}
