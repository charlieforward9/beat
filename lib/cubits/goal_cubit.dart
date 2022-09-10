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
  //TODO LateInitException here when global user is used
  String userId = 'f998c35f-9ba3-4546-a4b6-7bdc21c54073';

  GoalCubit() : super(LoadingGoals());

  void getDayGoals() async {
    // updateGoalPercentage("015ad3d8-868b-4153-9cf5-f7c49a024582");

    if (state is MapGoalsSuccess == false) {
      emit(LoadingGoals());
    }

    try {
      final goals = await goalService.getDailyGoals(userId);
      final goalLength = goals.length;
      goals.forEach((key, value) {
        final goalID = value.id;
        // print('Key: $key');
        // print('Value: $value');
        // print('GoalID: $goalID');
        //goalService.updateGoalCurrentDuration(goalID);
      });
      emit(MapGoalsSuccess(goals: goals));
    } catch (e) {
      emit(MapGoalsFailure(exception: Exception(e)));
    }
  }

  // create new functions here - start
  void updateGoalPercentage(String _goalID) async {
    //print("updatedGoalPercentage being called");
    await goalService.updateGoalCurrentDuration(_goalID);
  }

  // create new functions here - end

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
