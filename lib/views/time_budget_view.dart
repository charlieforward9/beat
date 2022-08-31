import 'time_budget_widgets/time_budget_widget.dart';
import 'package:flutter/material.dart';
import 'package:beat/app_theme.dart';
class TimeBudgetPage extends StatelessWidget {
  TimeBudgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          GoalCard(
            cardName: "Rest",
            cardGoal: "8hr",
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
          ButtonRow(buttonOneName: "Manual Entry", buttonTwoName: "New Goal"),
          Spacer(),
        ],
      ),
    );
  }
}
