import 'package:beat/data/Goal/services/GoalService.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/global.dart' as global;

abstract class GoalState {}

class LoadingGoals extends GoalState {}

class MapGoalsSuccess extends GoalState {
  late final Map<CategoryTypes, Goal> goals;

  MapGoalsSuccess({required this.goals});
}

class MapGoalsFailure extends GoalState {
  final Exception exception;

  MapGoalsFailure({required this.exception});
}

class GoalCubit extends Cubit<GoalState> {
  final goalService = GoalService();
  //TODO LateInitException here when global user is used
  // For Local Testing userID manual entry
  // String userID = 'f39a7c72-b41a-433f-8939-da0779c465dc';
  // For producting use the global user
  String userID = global.currentUser.id;

  GoalCubit() : super(LoadingGoals());

  void getDayGoals() async {
    if (state is MapGoalsSuccess == false) {
      emit(LoadingGoals());
    }

    try {
      final goals = await goalService.getLatestGoals(userID);

      emit(MapGoalsSuccess(goals: goals));
    } catch (e) {
      emit(MapGoalsFailure(exception: Exception(e)));
    }
  }

  void observeGoals() {
    goalService.observeGoals().listen((_) => getDayGoals());
  }
}
