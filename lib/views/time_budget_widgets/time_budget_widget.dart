import 'package:flutter/material.dart';

import '../../data/Goal/services/GoalService.dart';
//^ I moved the test functions to this path
import '../../data/Goal/services/GoalServiceTest.dart';

import '../../global.dart' as globalTest;
import '../../models/ModelProvider.dart';

class GoalCard extends StatefulWidget {
  final String cardName;
  final String cardGoal;
  final Color passedColor;

  final TextEditingController updatedGoal = TextEditingController();
  final TextEditingController updatedPercentage = TextEditingController();

  GoalServiceTest goalServiceTest = GoalServiceTest();

  GoalService goalService = GoalService();

  GoalCard(
      {Key? key,
      required this.cardName,
      required this.cardGoal,
      required this.passedColor})
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
            debugPrint('Card tapped - ${widget.cardName} Card.');
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
                  onPressed: () async {
                    //openDialog("99", "1000", "CAL", "d3de16cd-89d7-40f2-bb27-34392de557c3", widget.cardName);
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
        // TODO: Need to do error handeling for empty feilds.
        context: context,
        builder: (context) => AlertDialog(
          title: Text("$_type Info:"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Goal: "),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: _goal,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  controller: widget.updatedGoal,

                  //initialValue: _goal,
                ),
                Text("Percentage: "),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: _percentage,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  controller: widget.updatedPercentage,
                ),
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
