import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../data/Goal/services/GoalService.dart';
//^ I moved the test functions to this path
import '../../data/Goal/services/GoalServiceTest.dart';
import 'package:beat/controllers/time_budget_controller.dart' as controller;
import '../number_picker_widget/number_picker_widget.dart';

import '../../config/global.dart' as globalTest;
import '../../models/ModelProvider.dart';

class GoalCard extends StatefulWidget {
  final String cardName;
  // final String cardGoal;
  final double cardPercentage;
  final Color passedColor;
  final int cardGoalHours;
  final int cardGoalMinutes;
  final String goalID;

  final TextEditingController updatedGoal = TextEditingController();
  final TextEditingController updatedPercentage = TextEditingController();

  GoalServiceTest goalServiceTest = GoalServiceTest();

  GoalService goalService = GoalService();

  GoalCard(
      {Key? key,
      required this.goalID,
      required this.cardName,
      required this.cardGoalHours,
      required this.cardGoalMinutes,
      required this.cardPercentage,
      required this.passedColor})
      : super(key: key);

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  _setTime(int hours, int minutes) {
    setState(() {});
  }

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
                Expanded(flex: 2, child: Text('${widget.cardName}')),
                // SizedBox(width: 40),
                SizedBox(width: 5),
                Expanded(
                    flex: 1,
                    child: Text('${widget.cardGoalHours}h' +
                        ' ' +
                        '${widget.cardGoalMinutes}m')),
                SizedBox(width: 5),
                Expanded(
                    flex: 1,
                    child: Text(
                        '${double.parse((widget.cardPercentage).toStringAsFixed(2))}%')),
                //Spacer(),
                TextButton.icon(
                  onPressed: () async {
                    await openDialog(widget, context);
                    setState(() {});
                    // testDialog(
                    //     cardGoalHours: widget.cardGoalHours,
                    //     cardGoalMinutes: widget.cardGoalMinutes,
                    //     cardPercentage: widget.cardPercentage);
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

  Future<void> openDialog(widget, context) async {
    bool isGoalPressed = false;
    int hours = widget.cardGoalHours;
    int minutes = widget.cardGoalMinutes;
    showDialog(
        // TODO: Need to do error handeling for empty feilds.
        context: context,
        builder: (context) => StatefulBuilder(
              builder: ((context, setState) => AlertDialog(
                    title: Text("${widget.cardName} Info:"),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          TextButton(
                            child: Text(
                              "Goal: ${hours}h" + " ${minutes}m",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () async {
                              await showDialog(
                                  context: context,
                                  builder: (context) => StatefulBuilder(
                                        builder: (context, setState) =>
                                            AlertDialog(
                                          title: Text("Set Goal Duration:"),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text("Hours: "),
                                                        NumberPicker(
                                                          value: hours,
                                                          minValue: 0,
                                                          maxValue: hours + 10,
                                                          step: 1,
                                                          haptics: true,
                                                          onChanged: (value) =>
                                                              setState(() =>
                                                                  hours =
                                                                      value),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("Minutes: "),
                                                        NumberPicker(
                                                          value: minutes,
                                                          minValue: 0,
                                                          maxValue: 60,
                                                          step: 1,
                                                          haptics: true,
                                                          onChanged: (value) =>
                                                              setState(() =>
                                                                  minutes =
                                                                      value),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            Center(
                                              child: TextButton(
                                                  onPressed: () {
                                                    debugPrint(
                                                        "updated hours: $hours");
                                                    debugPrint(
                                                        "updated minutes: ${minutes}");
                                                    setState(() {});
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                      'Update Goal Duration')),
                                            )
                                          ],
                                        ),
                                      ));
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            widget.goalService.updateTargetDuration(
                                widget.goalID, hours, minutes);
                            Navigator.of(context).pop();
                          },
                          child: Text('Update Goals')),
                    ],
                  )),
            ));
  }
}

Future<void> openSecondDialog(widget, context) async {}

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
