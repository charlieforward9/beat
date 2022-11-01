import 'package:beat/cubits/goal_cubit.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:beat/views/loading_view.dart';
import 'package:beat/views/nav_tabs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'time_budget_widgets/time_budget_widget.dart';
import 'package:flutter/material.dart';
import 'package:beat/config/app_theme.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoalCubit()..getFirstGoals(),
      child: BlocBuilder<GoalCubit, GoalState>(builder: (context, state) {
        if (state is MapGoalsSuccess) {
          return state.goals.isEmpty
              ? _emptyGoals()
              : SafeArea(
                  child: Column(
                  children: [
                    const Text("Set your target goals"),
                    const Text(
                        "TODO only show this screen to first time users"),
                    _goalCardColumn(state.goals),
                    ElevatedButton(
                        onPressed: () => _openMainView(context),
                        child: const Text("Done"))
                  ],
                ));
        } else if (state is MapGoalsFailure) {
          return _exceptionView(state.exception);
        } else {
          return Column(
            children: [
              const Text("Init Page Loading"),
              LoadingView(),
            ],
          );
        }
      }),
    );
  }

  void _openMainView(context) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => NavTabs(),
      ),
    );
  }

  Widget _exceptionView(Exception exception) {
    return Center(child: Text(exception.toString()));
  }

  Widget _emptyGoals() {
    return const Center(
      child: Text('No goals yet'),
    );
  }

  Widget _goalCardColumn(Map<CategoryTypes, Goal> goals) {
    Goal rest = goals[CategoryTypes.REST]!;
    Goal fitness = goals[CategoryTypes.FITNESS]!;
    Goal fuel = goals[CategoryTypes.FUEL]!;
    Goal productivity = goals[CategoryTypes.PRODUCTIVITY]!;
    Goal social = goals[CategoryTypes.SOCIAL]!;

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(
          height: 40,
        ),
        //TODO Fix the Goal card and number picker functionality altogether
        //TODO Less GoalCard widget entries
        //TODO Bloc-controlled card view
        //TODO Remove warnings
        GoalCard(
          goalID: rest.id,
          cardName: rest.goalCategory.name,
          cardGoalHours: rest.goalTargetDuration.hours!,
          cardGoalMinutes: rest.goalTargetDuration.minutes!,
          cardPercentage: rest.goalPercentage,
          passedColor: BeatTheme.colors
              .restColor, 
        ),
        GoalCard(
          goalID: fitness.id,
          cardName: fitness.goalCategory.name,
          cardGoalHours: fitness.goalTargetDuration.hours!,
          cardGoalMinutes: fitness.goalTargetDuration.minutes!,
          cardPercentage: fitness.goalPercentage,
          passedColor: BeatTheme.colors
              .fitnessColor,
        ),
        GoalCard(
          goalID: fuel.id,
          cardName: fuel.goalCategory.name,
          cardGoalHours: fuel.goalTargetDuration.hours!,
          cardGoalMinutes: fuel.goalTargetDuration.minutes!,
          cardPercentage: fuel.goalPercentage,
          passedColor: BeatTheme.colors
              .socialColor, 
        ),
        GoalCard(
          goalID: productivity.id,
          cardName: productivity.goalCategory.name,
          cardGoalHours: productivity.goalTargetDuration.hours!,
          cardGoalMinutes: productivity.goalTargetDuration.minutes!,
          cardPercentage: productivity.goalPercentage,
          passedColor: BeatTheme.colors
              .fuelingColor, 
        ),
        GoalCard(
          goalID: social.id,
          cardName: social.goalCategory.name,
          cardGoalHours: social.goalTargetDuration.hours!,
          cardGoalMinutes: social.goalTargetDuration.minutes!,
          cardPercentage: social.goalPercentage,
          passedColor: BeatTheme.colors
              .workColor,
        ),
      ]),
    );
  }
}
