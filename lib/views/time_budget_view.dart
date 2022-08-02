import 'package:beat/models/CategoryTypes.dart';

import 'time_budget_widgets/time_budget_widget.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/views/home_widgets/app_theme.dart';
import '../../controllers/time_budget_controller.dart' as controller;

class TimeBudgetPage extends StatelessWidget {
  TimeBudgetPage({Key? key}) : super(key: key);
  final timeNow = TemporalDateTime.now();

  @override
  Future<Widget> build(BuildContext context) async {
    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          GoalCard(
              cardName: "Rest",
              cardGoal: await controller.getGoal(CategoryTypes.FITNESS, timeNow).then((value) => value),
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
