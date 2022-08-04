import 'package:beat/models/CategoryTypes.dart';
import 'package:beat/models/ModelProvider.dart';

import 'time_budget_widgets/time_budget_widget.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/views/home_widgets/app_theme.dart';

import '../data/Goal/services/GoalServiceTest.dart';

import '../../controllers/time_budget_controller.dart' as controller;

class TimeBudgetPage extends StatelessWidget {
  TimeBudgetPage({Key? key}) : super(key: key);
  final timeNow = TemporalDateTime.now();

  //final test = controller.TimeBudgetController().logOnlyLatestGoals();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: FutureBuilder<Goal>(
        future: controller.getGoal(),
        builder: (BuildContext context, AsyncSnapshot<Goal> snapshot) {
          List<Widget> children;
          if (snapshot.connectionState == ConnectionState.done) {
            try {
              children = <Widget>[
                Spacer(),
                GoalCard(
                    cardName: '${snapshot.data!.goalCategory}',
                    cardGoal: '${snapshot.data!.goalPercentage}',
                    passedColor: BeatTheme.colors.fitnessColor),
                SizedBox(height: 125),
                ButtonRow(
                    buttonOneName: "Manual Entry", buttonTwoName: "New Goal"),
                Spacer(),
              ];
            } catch (e) {
              print(e);
              children = [Text('error')];
            }
          } else if (snapshot.hasError) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result... (dummy data)'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      )),
    );
  }
}

/*

GoalCard(
              cardName: "Fitness",
              cardGoal: "1.5hr",
              passedColor: BeatTheme.colors.fuelingColor),
          GoalCard(
              cardName: "Fuel",
              cardGoal: "2000cal",
              passedColor: BeatTheme.colors.restColor),
          GoalCard(
              cardName: "Social",
              cardGoal: "1hr",
              passedColor: BeatTheme.colors.socialColor),
          GoalCard(
              cardName: "Productivity",
              cardGoal: "8hr",
              passedColor: BeatTheme.colors.workColor),
 */

/*
GoalCard(
    cardName: "Rest",
    cardGoal:
        "8hr", //await controller.getGoal(CategoryTypes.FITNESS, timeNow).then((value) => value),
    passedColor: BeatTheme.colors.fitnessColor),
  GoalCard(
    cardName: "Fitness",
    cardGoal: "1.5hr",
    passedColor: BeatTheme.colors.fuelingColor),
  GoalCard(
    cardName: "Fuel",
    cardGoal: "2000cal",
    passedColor: BeatTheme.colors.restColor),
  GoalCard(
    cardName: "Social",
    cardGoal: "1hr",
    passedColor: BeatTheme.colors.socialColor),
  GoalCard(
    cardName: "Productivity",
    cardGoal: "8hr",
    passedColor: BeatTheme.colors.workColor),
  SizedBox(height: 125),
*/