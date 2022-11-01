import 'dart:async';

import 'package:beat/data/Goal/services/GoalService.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  GoalCubit() : super(LoadingGoals());

  @override
  Future<void> close() async {
    super.close();
  }

  void getFirstGoals() async {
    if (state is MapGoalsSuccess == false) {
      emit(LoadingGoals());
    }
    try {
      final Map<CategoryTypes, Goal> goals = {};
      for (CategoryTypes cat in CategoryTypes.values) {
        goals[cat] = goalService.createGoal(cat);
      }
      emit(MapGoalsSuccess(goals: goals));
    } catch (e) {
      emit(MapGoalsFailure(exception: Exception(e)));
    }
  }

  void getDayGoals() async {
    if (state is MapGoalsSuccess == false) {
      emit(LoadingGoals());
    }
    try {
      final goals = await goalService.latestGoals;
      emit(MapGoalsSuccess(goals: goals));
    } catch (e) {
      emit(MapGoalsFailure(exception: Exception(e)));
    }
  }
  //TODO I removed the stream here because of issues with signing out and the stream/bloc not being closed. We want to get the goals by future instead of stream, because it does not have ot update in real time, only with user intervention.
}
