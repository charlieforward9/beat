import 'time_budget_widgets/time_budget_widget.dart';
import 'package:flutter/material.dart';

// //*************** Services Import *************** */
// import '../Features/Fitness/services/FitnessService.dart';
// import '../Features/Recovery/services/RecoveryService.dart';
// import '../Features/Fuel/services/FuelService.dart';
// import '../Features/Network/services/NetworkService.dart';
// import '../Features/Productivity/services/ProductivityService.dart';
//*************** Model Import *************** */
// import '../Features/Recovery/models/Recovery.dart';

class TimeBudgetPage extends StatelessWidget {
  TimeBudgetPage({Key? key}) : super(key: key);
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

  // //*************** Services *************** */
  // final FitnessService fitnessService = FitnessService();
  // final RecoveryService recoveryService = RecoveryService();
  // final FuelService fuelService = FuelService();
  // final NetworkService networkService = NetworkService();
  // final ProductivityService productivityService = ProductivityService();
  //*************** ID FOR TESTING *************** */
  final fitnessID = "c6a235e6-a42f-49f7-b9d2-0656c91d0880";
  final recoveryID = "c460788a-7519-49f6-baa0-81624b4d0748";
  final fuelID = "b403bc49-60dd-4b82-aa9c-2c2c6ac99765";
  final networkID = "57863e60-1f20-4bf9-89a5-c05968475a29";
  final productivityID = "ffbdee44-436e-4560-8d30-562235986c85";
  //*********************************************** */

  @override
  Widget build(BuildContext context) {
    // Future<Recovery> testRecovery = recoveryService.getRecordById(recoveryID);
    //Recovery test = await recoveryService.getRecordById(recoveryID);

    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          GoalCard(
            cardName: "Recovery",
            cardGoal: "8hr",
            passedColor: Color.fromARGB(255, 162, 108, 255),
            ID: recoveryID,
          ),
          GoalCard(
            cardName: "Fitness",
            cardGoal: "1.5hr",
            passedColor: Color.fromARGB(255, 255, 99, 99),
            ID: recoveryID,
          ),
          GoalCard(
            cardName: "Fuel",
            cardGoal: "2000cal",
            passedColor: Color.fromARGB(255, 255, 255, 87),
            ID: recoveryID,
          ),
          GoalCard(
            cardName: "Network",
            cardGoal: "1hr",
            passedColor: Color.fromARGB(255, 169, 200, 255),
            ID: recoveryID,
          ),
          GoalCard(
            cardName: "Productivity",
            cardGoal: "8hr",
            passedColor: Color.fromARGB(255, 110, 255, 141),
            ID: recoveryID,
          ),
          SizedBox(height: 125),
          // ButtonRow(buttonOneName: "Manual Entry", buttonTwoName: "New Goal"),
          Spacer(),
        ],
      ),
    );
  }
}
