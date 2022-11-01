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
        GoalCard(
          cardName: rest.goalCategory.name,
          cardGoal:
              '${rest.goalTargetDuration.hours}h ${rest.goalTargetDuration.minutes}m',
          passedColor: BeatTheme.colors.restColor,
        ),
        GoalCard(
          cardName: fitness.goalCategory.name,
          cardGoal:
              '${fitness.goalTargetDuration.hours}h ${fitness.goalTargetDuration.minutes}m',
          passedColor: BeatTheme.colors.fitnessColor,
        ),
        GoalCard(
          cardName: fuel.goalCategory.name,
          cardGoal:
              '${fuel.goalTargetDuration.hours}h ${fuel.goalTargetDuration.minutes}m',
          passedColor: BeatTheme.colors.socialColor,
        ),
        GoalCard(
          cardName: productivity.goalCategory.name,
          cardGoal:
              '${productivity.goalTargetDuration.hours}h ${productivity.goalTargetDuration.minutes}m',
          passedColor: BeatTheme.colors.fuelingColor,
        ),
        GoalCard(
          cardName: social.goalCategory.name,
          cardGoal:
              '${social.goalTargetDuration.hours}h ${social.goalTargetDuration.minutes}m',
          passedColor: BeatTheme.colors.workColor,
        ),
      ]),
    );
  }
}
