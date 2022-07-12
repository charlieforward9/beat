import 'package:flutter/material.dart';

import '../UI/completion_widget.dart';
import '../UI/home_progress_card.dart';

//*************** Services Import *************** */
import '../Features/Fitness/services/FitnessService.dart';
import '../Features/Recovery/services/RecoveryService.dart';
import '../Features/Fuel/services/FuelService.dart';
import '../Features/Network/services/NetworkService.dart';
import '../Features/Productivity/services/ProductivityService.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //TODO Create a storage unit for this good stuff
  //************************* */
  final goal1 = "";
  final goal2 = "Fitness";
  final goal3 = "Social";
  final goal4 = "Fueling";
  final goal5 = "Work";

  //final goal1Color = const Color.fromARGB(255, 162, 108, 255);
  //final goal2Color = const Color.fromARGB(255, 255, 99, 99);
  //final goal3Color = const Color.fromARGB(255, 169, 200, 255);
  //final goal4Color = const Color.fromARGB(255, 255, 255, 87);
  //final goal5Color = const Color.fromARGB(255, 110, 255, 141);

//This is just for testing
  double goal1P = 0.0;
  double goal2P = 0.0;
  double goal3P = 0.0;
  double goal4P = 0.0;
  double goal5P = 0.0;
//****************************** */

//*************** Services *************** */
  FitnessService fitnessService = FitnessService();
  RecoveryService recoveryService = RecoveryService();
  FuelService fuelService = FuelService();
  NetworkService networkService = NetworkService();
  ProductivityService productivityService = ProductivityService();
  //*************** ID FOR TESTING *************** */
  final fitnessID = "c6a235e6-a42f-49f7-b9d2-0656c91d0880";
  final recoveryID = "c460788a-7519-49f6-baa0-81624b4d0748";
  final fuelID = "b403bc49-60dd-4b82-aa9c-2c2c6ac99765";
  final networkID = "57863e60-1f20-4bf9-89a5-c05968475a29";
  final productivityID = "ffbdee44-436e-4560-8d30-562235986c85";
  //*********************************************** */

  void fetchData() {
    // recoveryService.getRecordById(recoveryID).then(
    //   (value) {
    //     goal1P = value.percentage!;
    //   },
    // );
    // fitnessService.getRecordById(fitnessID).then(
    //   (value) {
    //     goal2P = value.percentage!;
    //   },
    // );
    // networkService.getRecordById(networkID).then(
    //   (value) {
    //     goal3P = value.percentage!;
    //   },
    // );
    // fuelService.getRecordById(fuelID).then(
    //   (value) {
    //     goal4P = value.percentage!;
    //   },
    // );
    // productivityService.getRecordById(productivityID).then(
    //   (value) {
    //     goal5P = value.percentage!;
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
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
        //TODO: Fix these colors (dillan)
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
