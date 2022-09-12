import 'package:beat/data/Activity/services/ActivityService.dart';
import 'package:beat/data/Goal/services/GoalService.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../global.dart' as global;

abstract class ActivityState {}

class LoadingActivities extends ActivityState {}

class MapActivitiesSuccess extends ActivityState {
  late final Map<CategoryTypes, Goal> activities;
  MapActivitiesSuccess();
}

class MapActivitiesFailure extends ActivityState {
  final Exception exception;
  MapActivitiesFailure({required this.exception});
}

class ActivityCubit extends Cubit<ActivityState> {
  final goalService = GoalService();
  final activityService = ActivityService();
  //TODO LateInitException here when global user is used

  // for local testing use manual userID
  // String userID = 'f39a7c72-b41a-433f-8939-da0779c465dc';
  // for deployment user the global userID
  String userID = global.currentUser.id;

  ActivityCubit() : super(LoadingActivities());

  void updateGoalPercentage(String _goalID) async {
    //print("updatedGoalPercentage being called");
    await goalService.updateGoalCurrentDuration(_goalID);
  }

  void updateGoals() async {
    // need to get all the goals
    // then update the percentage on all the goals
    final goals = await goalService.getLatestGoals(userID);
    goals.forEach((key, value) {
      final goalID = value.id;
      updateGoalPercentage(goalID);
    });
    // print("UPDATING GOAL ACTIVITIES");
    if (state is MapActivitiesSuccess == false) {
      emit(LoadingActivities());
    }

    try {
      emit(MapActivitiesSuccess());
    } catch (e) {
      emit(MapActivitiesFailure(exception: Exception(e)));
    }
  }

  void presentChanges() {
    // print("OBSERVING ALL ACTIVITIES");
    activityService.streamChanges().listen((_) => updateGoals());
  }
}
