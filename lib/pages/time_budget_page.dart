import '../UI/time_budget_widget.dart';
import 'package:flutter/material.dart';

class TimeBudgetPage extends StatelessWidget {
  const TimeBudgetPage({Key? key}) : super(key: key);
  //TODO Create a storage unit for this good stuff
  //************************* */
  final goal1 = "Rest";
  final goal2 = "Fitness";
  final goal3 = "Social";
  final goal4 = "Fueling";
  final goal5 = "Work";

  final goal1Color = const Color.fromARGB(255, 162, 108, 255);
  final goal2Color = const Color.fromARGB(255, 255, 99, 99);
  final goal3Color = const Color.fromARGB(255, 169, 200, 255);
  final goal4Color = const Color.fromARGB(255, 255, 255, 87);
  final goal5Color = const Color.fromARGB(255, 110, 255, 141);

//This is just for testing
  final goal1P = 90.0;
  final goal2P = 9.0;
  final goal3P = 52.0;
  final goal4P = 31.4;
  final goal5P = 3.0;
//****************************** */

//*************** ID FOR TESTING *************** */
  final fitnessID = "c6a235e6-a42f-49f7-b9d2-0656c91d0880";
  final recoveryID = "c460788a-7519-49f6-baa0-81624b4d0748";
//*********************************************** */

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          GoalCard(
            cardName: "Fitness",
            cardGoal: "1.5hr",
            passedColor: Color.fromARGB(255, 255, 99, 99),
            ID: "c6a235e6-a42f-49f7-b9d2-0656c91d0880",
          ),
          GoalCard(
            cardName: "Fueling",
            cardGoal: "2000cal",
            passedColor: Color.fromARGB(255, 255, 255, 87),
            ID: "c6a235e6-a42f-49f7-b9d2-0656c91d0880",
          ),
          GoalCard(
            cardName: "Rest",
            cardGoal: "8hr",
            passedColor: Color.fromARGB(255, 162, 108, 255),
            ID: "c6a235e6-a42f-49f7-b9d2-0656c91d0880",
          ),
          GoalCard(
            cardName: "Social",
            cardGoal: "1hr",
            passedColor: Color.fromARGB(255, 169, 200, 255),
            ID: "c6a235e6-a42f-49f7-b9d2-0656c91d0880",
          ),
          GoalCard(
            cardName: "Work",
            cardGoal: "8hr",
            passedColor: Color.fromARGB(255, 110, 255, 141),
            ID: "c6a235e6-a42f-49f7-b9d2-0656c91d0880",
          ),
          SizedBox(height: 125),
          ButtonRow(buttonOneName: "Manual Entry", buttonTwoName: "New Goal"),
          Spacer(),
        ],
      ),
    );
  }
}
