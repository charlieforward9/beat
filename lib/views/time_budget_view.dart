import 'dart:developer';

import 'package:beat/models/ModelProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'time_budget_widgets/time_budget_widget.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/views/loading_view.dart';
import 'package:beat/config/app_theme.dart';
import '../cubits/goal_cubit.dart';

class TimeBudgetPage extends StatelessWidget {
  TimeBudgetPage({Key? key}) : super(key: key);
  final timeNow = TemporalDateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<GoalCubit, GoalState>(builder: (context, state) {
      if (state is MapGoalsSuccess) {
        return state.goals.isEmpty ? emptyGoals() : completionView(state.goals);
      } else if (state is MapGoalsFailure) {
        return _exceptionView(state.exception);
      } else {
        return LoadingView();
      }
    }));
  }

  Widget _exceptionView(Exception exception) {
    return Center(child: Text(exception.toString()));
  }

  Widget emptyGoals() {
    return const Center(
      child: Text('No goals yet'),
    );
  }

  Widget completionView(Map<CategoryTypes, Goal> goals) {
    Goal recovery = goals[CategoryTypes.REST]!;
    Goal fitness = goals[CategoryTypes.FITNESS]!;
    Goal fuel = goals[CategoryTypes.FUEL]!;
    Goal productivity = goals[CategoryTypes.PRODUCTIVITY]!;
    Goal social = goals[CategoryTypes.SOCIAL]!;
    debugPrint(fitness.toString());

    final goal1 = recovery.goalCategory.name;
    final goal2 = fitness.goalCategory.name;
    final goal3 = fuel.goalCategory.name;
    final goal4 = productivity.goalCategory.name;
    final goal5 = social.goalCategory.name;

    final goal1Duration = recovery.goalTargetDuration;
    final goal2Duration = fitness.goalTargetDuration;
    final goal3Duration = fuel.goalTargetDuration;
    final goal4Duration = productivity.goalTargetDuration;
    final goal5Duration = social.goalTargetDuration;

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(
          height: 40,
        ),
        GoalCard(
          goalID: recovery.id,
          cardName: goal1,
          cardGoalHours: goal1Duration.hours!,
          cardGoalMinutes: goal1Duration.minutes!,
          cardPercentage: recovery.goalPercentage,
          passedColor: BeatTheme.colors
              .restColor, //TODO Dillan (is this fixed?) clash with current AppTheme class in completion_ring.dart
        ),
        GoalCard(
          goalID: fitness.id,
          cardName: goal2,
          cardGoalHours: goal2Duration.hours!,
          cardGoalMinutes: goal2Duration.minutes!,
          cardPercentage: fitness.goalPercentage,
          passedColor: BeatTheme.colors
              .fitnessColor, //TODO Dillan (is this fixed?) clash with current AppTheme class in completion_ring.dart
        ),
        GoalCard(
          goalID: fuel.id,
          cardName: goal3,
          cardGoalHours: goal3Duration.hours!,
          cardGoalMinutes: goal3Duration.minutes!,
          cardPercentage: fuel.goalPercentage,
          passedColor: BeatTheme.colors
              .socialColor, //TODO Dillan (is this fixed?) clash with current AppTheme class in completion_ring.dart
        ),
        GoalCard(
          goalID: productivity.id,
          cardName: goal4,
          cardGoalHours: goal4Duration.hours!,
          cardGoalMinutes: goal4Duration.minutes!,
          cardPercentage: productivity.goalPercentage,
          passedColor: BeatTheme.colors
              .fuelingColor, //TODO Dillan (is this fixed?) clash with current AppTheme class in completion_ring.dart
        ),
        GoalCard(
          goalID: social.id,
          cardName: goal5,
          cardGoalHours: goal5Duration.hours!,
          cardGoalMinutes: goal5Duration.minutes!,
          cardPercentage: social.goalPercentage,
          passedColor: BeatTheme.colors
              .workColor, //TODO Dillan (is this fixed?) clash with current AppTheme class in completion_ring.dart
        ),
      ]),
    );
  }
}
