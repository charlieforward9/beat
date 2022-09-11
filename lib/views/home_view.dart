import 'package:beat/cubits/activity_cubit.dart';
import 'package:beat/cubits/goal_cubit.dart';
import 'package:beat/cubits/activity_cubit.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:beat/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:beat/views/home_widgets/app_theme.dart';

import 'home_widgets/completion_widget.dart';
import 'home_widgets/home_progress_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//*************** Services Import *************** */
// import '../Features/Fitness/services/FitnessService.dart';
// import '../Features/Recovery/services/RecoveryService.dart';
// import '../Features/Fuel/services/FuelService.dart';
// import '../Features/Network/services/NetworkService.dart';
// import '../Features/Productivity/services/ProductivityService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CompletionViewState();
}

class CompletionViewState extends State<HomePage> {
  // completionViewState({Key? key}) : super(key: key);

  //TODO Create a storage unit for this good stuff
  //************************* */
  final goal1 = "Rest";
  final goal2 = "Fitness";
  final goal3 = "Social";
  final goal4 = "Fuel";
  final goal5 = "Work";

//This is just for testing
  double goal1P = 40.0;
  double goal2P = 20.0;
  double goal3P = 23.0;
  double goal4P = 90.0;
  double goal5P = 74.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<ActivityCubit, ActivityState>(builder: (context, state) {
        return BlocBuilder<GoalCubit, GoalState>(builder: (context, state) {
          if (state is MapGoalsSuccess) {
            return state.goals.isEmpty
                ? emptyGoals()
                : completionView(state.goals);
          } else if (state is MapGoalsFailure) {
            return _exceptionView(state.exception);
          } else {
            return LoadingView();
          }
        });
      }),
    );
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

    double goal1P = recovery.goalPercentage;
    double goal2P = fitness.goalPercentage;
    double goal3P = fuel.goalPercentage;
    double goal4P = productivity.goalPercentage;
    double goal5P = social.goalPercentage;

    final goal1 = recovery.goalCategory.name;
    final goal2 = fitness.goalCategory.name;
    final goal3 = fuel.goalCategory.name;
    final goal4 = productivity.goalCategory.name;
    final goal5 = social.goalCategory.name;

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(
          height: 40,
        ),
        CompletionWidget(
            bucketProgress: goal1P,
            firstRingProgress: goal2P,
            secondRingProgress: goal3P,
            thirdRingProgress: goal4P,
            fourthRingProgress: goal5P),

        //TODO: Order by percentDone aescending, when at 100, push to bottom
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        HomeProgressCard(
          goalTitle: goal1,
          percentDone: goal1P,
          goalColor: BeatTheme.colors
              .restColor, //TODO Dillan (is this fixed?) clash with current AppTheme class in completion_ring.dart
        ),
        HomeProgressCard(
          goalTitle: goal2,
          percentDone: goal2P,
          goalColor: BeatTheme.colors.fitnessColor,
        ),
        HomeProgressCard(
          goalTitle: goal3,
          percentDone: goal3P,
          goalColor: BeatTheme.colors.socialColor,
        ),
        HomeProgressCard(
          goalTitle: goal4,
          percentDone: goal4P,
          goalColor: BeatTheme.colors.fuelingColor,
        ),
        HomeProgressCard(
          goalTitle: goal5,
          percentDone: goal5P,
          goalColor: BeatTheme.colors.workColor,
        ),
      ]),
    );
  }
}
