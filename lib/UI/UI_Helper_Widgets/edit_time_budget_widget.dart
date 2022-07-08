import 'package:flutter/material.dart';
//***********Backend-related Imports***********//
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import '../../amplifyconfiguration.dart';

import '../../models/ModelProvider.dart';

import '../../Features/Fitness/services/FitnessService.dart';
import '../../Features/Recovery/services/RecoveryService.dart';

class EditTimeBudget extends StatefulWidget {
  const EditTimeBudget({Key? key}) : super(key: key);

  @override
  State<EditTimeBudget> createState() => _EditTimeBudgetState();
}

class _EditTimeBudgetState extends State<EditTimeBudget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  final fitnessID = "c6a235e6-a42f-49f7-b9d2-0656c91d0880";

  final recoveryID = "c460788a-7519-49f6-baa0-81624b4d0748";

  FitnessService fitnessService = FitnessService();

  RecoveryService recoveryService = RecoveryService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: myController,
            decoration: const InputDecoration(
              hintText: 'Update Fitness Screen',
            ),
          ),
          FloatingActionButton(
            // When the user presses the button, show an alert dialog containing
            // the text that the user has entered into the text field.
            onPressed: () {
              fitnessService.resetGoal(
                  fitnessID, double.parse(myController.text));
              //recoveryService.resetGoal(recoveryID, 6789999);
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return AlertDialog(
              //       // Retrieve the text that the user has entered by using the
              //       // TextEditingController.
              //       content: Text(myController.text),
              //     );
              //   },
              // );
            },
            tooltip: 'Show me the value!',
            child: const Icon(Icons.text_fields),
          ),
        ],
      ),
    );
  }
}
