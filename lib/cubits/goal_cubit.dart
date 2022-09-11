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
  String userId = 'f998c35f-9ba3-4546-a4b6-7bdc21c54073';

  GoalCubit() : super(LoadingGoals());

  void getDayGoals() async {
    if (state is MapGoalsSuccess == false) {
      emit(LoadingGoals());
    }

    try {
      final goals = await goalService.getLatestGoals(userId);
      emit(MapGoalsSuccess(goals: goals));
    } catch (e) {
      emit(MapGoalsFailure(exception: Exception(e)));
    }
  }

  void observeGoals() {
    goalService.observeGoals().listen((_) => getDayGoals());
  }

  // void createTodo(String title) async {
  //   await _todoRepo.createTodo(title);
  //   getTodos();
  // }

  // void updateTodoIsComplete(Todo todo, bool isComplete) async {
  //   await _todoRepo.updateTodoIsComplete(todo, isComplete);
  //   getTodos();
  // }
}
