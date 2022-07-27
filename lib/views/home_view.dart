import 'package:flutter/material.dart';
import 'package:beat/views/home_widgets/app_theme.dart';

import 'home_widgets/completion_widget.dart';
import 'home_widgets/home_progress_card.dart';

//*************** Services Import *************** */
// import '../Features/Fitness/services/FitnessService.dart';
// import '../Features/Recovery/services/RecoveryService.dart';
// import '../Features/Fuel/services/FuelService.dart';
// import '../Features/Network/services/NetworkService.dart';
// import '../Features/Productivity/services/ProductivityService.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
          goalColor: BeatTheme.colors.fitnessColor, //TODO Dillan (is this fixed?) clash with current AppTheme class in completion_ring.dart
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
