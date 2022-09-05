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
          child: FutureBuilder<List<Goal>>(
        future: controller
            .getUsersLatestGoals("985924ea-f60a-4deb-89d9-ad6c71fec5c6"),
        builder: (BuildContext context, AsyncSnapshot<List<Goal>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                //String name_of_activity = snapshot.data![index].id;
                return GoalCard(
                    //cardName: '${snapshot.data!.goalCategory.name}',
                    cardName: '${snapshot.data![index].goalCategory.name}',
                    cardGoal:
                        '${snapshot.data![index].goalTargetDuration.durationHours}h ${snapshot.data![index].goalTargetDuration.durationMinutes}m',
                    passedColor: BeatTheme.colors.fitnessColor);
              },
            );
          }

          /// handles others as you did on question
          else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }

  // Widget build(BuildContext context) {
  //   return Center(
  //     child: Container(
  //         child: FutureBuilder<Goal>(
  //       future:
  //           controller.getAllActivities("f49cf805-6ada-4731-87a6-8b1fb027660c"),
  //       builder: (BuildContext context, AsyncSnapshot<Goal> snapshot) {
  //         List<Widget> children;
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           try {
  //             children = <Widget>[
  //               Spacer(),
  //               GoalCard(
  //                   //cardName: '${snapshot.data!.goalCategory.name}',
  //                   cardName: '${snapshot.data!.goalCategory.name}',
  //                   cardGoal:
  //                       '${snapshot.data!.goalTargetDuration.durationHours}h ${snapshot.data!.goalTargetDuration.durationMinutes}m',
  //                   passedColor: BeatTheme.colors.fitnessColor),
  //               SizedBox(height: 125),
  //               ButtonRow(
  //                   buttonOneName: "Manual Entry", buttonTwoName: "New Goal"),
  //               Spacer(),
  //             ];
  //           } catch (e) {
  //             print(e);
  //             children = [Text('error')];
  //           }
  //         } else if (snapshot.hasError) {
  //           children = <Widget>[
  //             Padding(
  //               padding: const EdgeInsets.only(top: 16),
  //               child: Text('Error: ${snapshot.error}'),
  //             )
  //           ];
  //         } else {
  //           children = const <Widget>[
  //             Padding(
  //               padding: EdgeInsets.only(top: 16),
  //               child: Text('Awaiting result... (dummy data)'),
  //             )
  //           ];
  //         }
  //         return Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: children,
  //           ),
  //         );
  //       },
  //     )),
  //   );
  // }
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