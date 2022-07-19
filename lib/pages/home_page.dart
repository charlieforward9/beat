//import 'package:beat/UI/UI_Helper_Widgets/completion_ring.dart';
import 'package:beat/views/home_widgets/app_theme.dart';
import 'package:flutter/material.dart';

import '../views/home_widgets/completion_widget.dart';
import '../views/home_widgets/home_progress_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(
          height: 40,
        ),
        //TODO COMPLETION WIDGET GOES HERE
        CompletionWidget(
            bucketProgress: goal1P,
            firstRingProgress: goal2P,
            secondRingProgress: goal3P,
            thirdRingProgress: goal4P,
            fourthRingProgress: goal5P),

        //TODO: Order by percentDone aescending, when at 100, push to bottom
        HomeProgressCard(
          goalTitle: goal1,
          percentDone: goal1P,
          goalColor: BeatTheme.colors
              .fitnessColor, //clash with current AppTheme class in completion_ring.dart
        ),
        HomeProgressCard(
            goalTitle: goal2,
            percentDone: goal2P,
            goalColor: BeatTheme.colors.fuelingColor),
        HomeProgressCard(
            goalTitle: goal3,
            percentDone: goal3P,
            goalColor: BeatTheme.colors.restColor),
        HomeProgressCard(
            goalTitle: goal4,
            percentDone: goal4P,
            goalColor: BeatTheme.colors.socialColor),
        HomeProgressCard(
            goalTitle: goal5,
            percentDone: goal5P,
            goalColor: BeatTheme.colors.workColor)
      ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //This is where the data should be sent to the EMR
      //     Navigator.pop(context);
      //   },
      //   tooltip: 'Back to Home Screen',
      //   child: const Icon(Icons.arrow_back_ios_new_rounded),
      // ),
    );
  }
}
