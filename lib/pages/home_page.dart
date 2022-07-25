import 'package:beat/Features/Goal/services/GoalServicesTest.dart';
import 'package:flutter/material.dart';

import '../UI/completion_widget.dart';
import '../UI/home_progress_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final goal1 = "";
  final goal2 = "Fitness";
  final goal3 = "Social";
  final goal4 = "Fueling";
  final goal5 = "Work";

//This is just for testing
  double goal1P = 0.0;
  double goal2P = 0.0;
  double goal3P = 0.0;
  double goal4P = 0.0;
  double goal5P = 0.0;

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
            goalColor: Theme.of(context).colorScheme.secondary),
        HomeProgressCard(
            goalTitle: goal2,
            percentDone: goal2P,
            goalColor: Theme.of(context).colorScheme.tertiary),
        HomeProgressCard(
            goalTitle: goal3,
            percentDone: goal3P,
            goalColor: Theme.of(context).colorScheme.secondary),
        HomeProgressCard(
            goalTitle: goal4,
            percentDone: goal4P,
            goalColor: Theme.of(context).colorScheme.primary),
        HomeProgressCard(
            goalTitle: goal5,
            percentDone: goal5P,
            goalColor: Theme.of(context).colorScheme.primary),
    ]));
  }
}
