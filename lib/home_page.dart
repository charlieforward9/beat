import 'package:flutter/material.dart';
import 'package:beat/UI/completion_ring.dart';
import 'package:beat/UI/home_progress_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //Create a constant goals dataframe
  final goal1 = "Rest";
  final goal2 = "Fitness";
  final goal3 = "Social";
  final goal4 = "Fueling";
  final goal5 = "Work";
  final goal1Color = Color.fromARGB(255, 162, 108, 255);
  final goal2Color = Color.fromARGB(255, 255, 99, 99);
  final goal3Color = Color.fromARGB(255, 169, 200, 255);
  final goal4Color = Color.fromARGB(255, 255, 255, 87);
  final goal5Color = Color.fromARGB(255, 110, 255, 141);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 40),
          const SizedBox(
              //TODO: BUCKET AND RINGS DO IN THIS AREA
              width: 240,
              child: TaskCompletionRing()),

          //TODO: Order by percentDone aescending, when at 100, push to bottom
          HomeProgressCard(
              goalTitle: goal1, percentDone: 90, goalColor: goal1Color),
          HomeProgressCard(
              goalTitle: goal2, percentDone: 89, goalColor: goal2Color),
          HomeProgressCard(
              goalTitle: goal3, percentDone: 52, goalColor: goal3Color),
          HomeProgressCard(
              goalTitle: goal4, percentDone: 10, goalColor: goal4Color),
          HomeProgressCard(
              goalTitle: goal5, percentDone: 5, goalColor: goal5Color),
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //This is where the data should be sent to the EMR
          Navigator.pop(context);
        },
        tooltip: 'Back to Home Screen',
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
