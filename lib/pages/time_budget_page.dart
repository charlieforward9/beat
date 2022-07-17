import '../UI/time_budget_widget.dart';
import 'package:flutter/material.dart';
import 'package:beat/UI/app_theme.dart';

class TimeBudgetPage extends StatelessWidget {
  const TimeBudgetPage({Key? key}) : super(key: key);
  //TODO Create a storage unit for this good stuff
  //************************* */
  final goal1 = "Rest";
  final goal2 = "Fitness";
  final goal3 = "Social";
  final goal4 = "Fueling";
  final goal5 = "Work";

//This is just for testing
  final goal1P = 90.0;
  final goal2P = 9.0;
  final goal3P = 52.0;
  final goal4P = 31.4;
  final goal5P = 3.0;
//****************************** */

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          GoalCard(
              cardName: "Fitness",
              cardGoal: "1.5hr",
              passedColor: BeatTheme.colors.fitnessColor),
          GoalCard(
              cardName: "Fueling",
              cardGoal: "2000cal",
              passedColor: BeatTheme.colors.fuelingColor),
          GoalCard(
              cardName: "Rest",
              cardGoal: "8hr",
              passedColor: BeatTheme.colors.restColor),
          GoalCard(
              cardName: "Social",
              cardGoal: "1hr",
              passedColor: BeatTheme.colors.socialColor),
          GoalCard(
              cardName: "Work",
              cardGoal: "8hr",
              passedColor: BeatTheme.colors.workColor),
          SizedBox(height: 125),
          ButtonRow(buttonOneName: "Manual Entry", buttonTwoName: "New Goal"),
          Spacer(),
        ],
      ),
    );
  }
}
