import 'package:beat/data/Goal/services/GoalService.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../global.dart' as global;

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
  String userId = '190c7bd1-02ad-4ab1-970d-49b8e6f7a9f8';

  GoalCubit() : super(LoadingGoals());

  void getDayGoals() async {
    if (state is MapGoalsSuccess == false) {
      emit(LoadingGoals());
    }

    try {
      final goals = await goalService.getDailyGoals(userId);
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
