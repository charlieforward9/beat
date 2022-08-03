import 'package:beat/data/Goal/services/GoalServiceTest.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:beat/views/home_widgets/app_theme.dart';

import 'home_widgets/completion_widget.dart';
import 'home_widgets/home_progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        FutureBuilder(
            future: GoalServiceTest().latestFitnessGoal(),
            builder: (BuildContext context, AsyncSnapshot<Goal> snapshot) {
              List<Widget> children;

              if (snapshot.connectionState == ConnectionState.done) {
                try {
                  print(snapshot.data!.goalCategory.name.toLowerCase());
                  children = <Widget>[
                    HomeProgressCard(
                      goalTitle: snapshot.data!.goalCategory.name.toLowerCase(),
                      percentDone: goal1P,
                      goalColor: BeatTheme.colors
                          .fitnessColor, //TODO Dillan (is this fixed?) clash with current AppTheme class in completion_ring.dart
                    ),
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
                    child: Text('NULL DATA RETURNING'),
                  )
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              );
            })
      ]),
    );
  }
}



// HomeProgressCard(
//           goalTitle: goal1,
//           percentDone: goal1P,
//           goalColor: BeatTheme.colors.fitnessColor, //TODO Dillan (is this fixed?) clash with current AppTheme class in completion_ring.dart
//         ),
//         HomeProgressCard(
//           goalTitle: goal2,
//           percentDone: goal2P,
//           goalColor: BeatTheme.colors.fitnessColor,
//         ),
//         HomeProgressCard(
//           goalTitle: goal3,
//           percentDone: goal3P,
//           goalColor: BeatTheme.colors.socialColor,
//         ),
//         HomeProgressCard(
//           goalTitle: goal4,
//           percentDone: goal4P,
//           goalColor: BeatTheme.colors.fuelingColor,
//         ),
//         HomeProgressCard(
//           goalTitle: goal5,
//           percentDone: goal5P,
//           goalColor: BeatTheme.colors.workColor,
//         ),
