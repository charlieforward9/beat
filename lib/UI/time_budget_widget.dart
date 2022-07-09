import 'package:beat/Features/Fuel/services/FuelService.dart';
import 'package:beat/Features/Network/services/NetworkService.dart';
import 'package:beat/Features/Productivity/services/ProductivityService.dart';
import 'package:flutter/material.dart';
import '../pages/edit_time_budget_page.dart';

import '../../Features/Fitness/services/FitnessService.dart';
import '../../Features/Recovery/services/RecoveryService.dart';
import '../Features/Fitness/models/Fitness.dart';
import '../Features/Recovery/models/Recovery.dart';

class GoalCard extends StatefulWidget {
  final String cardName;
  final String cardGoal;
  final Color passedColor;
  final String ID;

  FitnessService fitnessService = FitnessService();
  RecoveryService recoveryService = RecoveryService();
  FuelService fuelService = FuelService();
  NetworkService networkService = NetworkService();
  ProductivityService productivityService = ProductivityService();

  //*************** ID FOR TESTING *************** */
  final fitnessID = "c6a235e6-a42f-49f7-b9d2-0656c91d0880";
  final recoveryID = "c460788a-7519-49f6-baa0-81624b4d0748";
  //*********************************************** */

  GoalCard(
      {Key? key,
      required this.cardName,
      required this.cardGoal,
      required this.passedColor,
      required this.ID})
      : super(key: key);

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: widget.passedColor,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped - Goal Card.');
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 15,
            height: MediaQuery.of(context).size.height / 12,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 5),
                Expanded(child: Text('${widget.cardName}')),
                //SizedBox(width: 25),
                Expanded(flex: 1, child: Text('${widget.cardGoal}')),
                //Spacer(),
                TextButton.icon(
                  onPressed: () {

                    // ========= EXAMPLE ===========
                    widget.recoveryService.getRecordById(widget.recoveryID).then((value) =>
                    openDialog(
                        value.percentage.toString(),
                        value.goal.toString(),
                        "CAL",
                        '${widget.ID}', '${widget.cardName}')
                    );

                    // openDialog(
                    //     (69.0).toString(), (1000.0).toString(), "CAL", '${widget.ID}', '${widget.cardName}');
                  },
                  icon: Icon(Icons.create_sharp, size: 18),
                  label: Text(""),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  Future openDialog(_percentage, _goal, _metric, _id, _type) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Goal Info:"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                if (_type == "Fitness") ...[
                  TextFormField(
                    decoration: InputDecoration(prefixText: "Goal:"),
                    initialValue: _goal,
                  ),
                  TextFormField(
                    decoration: InputDecoration(prefixText: "Percentage:"),
                    //initialValue: "69%",
                    initialValue:_percentage
                        //widget.recoveryService.getRecordById(_id) as String,
                  ),
                ]
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Update Goals')),
          ],
        ),
      );
}

class TestPoop extends StatelessWidget {
  const TestPoop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog();
  }
}

class ButtonRow extends StatefulWidget {
  final buttonOneName;
  final buttonTwoName;
  const ButtonRow({
    Key? key,
    required this.buttonOneName,
    required this.buttonTwoName,
  }) : super(key: key);

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 25),
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  // Respond to button press
                },
                child: Text('${widget.buttonOneName}'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                ))),
        SizedBox(width: 25),
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  // Respond to button press
                },
                child: Text('${widget.buttonTwoName}'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                ))),
        SizedBox(width: 25),
      ],
    );
  }
}
