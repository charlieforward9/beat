import 'package:flutter/material.dart';

class GoalCard extends StatefulWidget {
  final String cardName;
  final String cardGoal;
  final Color passedColor;

  final TextEditingController updatedGoal = TextEditingController();
  final TextEditingController updatedPercentage = TextEditingController();

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
                    //TODO Where is this widget?
                    //Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => EditTimeBudget()));

                    // // ========= EXAMPLE ===========
                    // if (widget.cardName == "Recovery") {
                    //   widget.recoveryService
                    //       .getRecordById(widget.recoveryID)
                    //       .then((value) => openDialog(
                    //           value.percentage.toString(),
                    //           value.goal.toString(),
                    //           "CAL",
                    //           '${widget.ID}',
                    //           '${widget.cardName}'));
                    // } else if (widget.cardName == "Fitness") {
                    //   widget.fitnessService
                    //       .getRecordById(widget.fitnessID)
                    //       .then((value) => openDialog(
                    //           value.percentage.toString(),
                    //           value.goal.toString(),
                    //           "CAL",
                    //           '${widget.ID}',
                    //           '${widget.cardName}'));
                    // } else if (widget.cardName == "Network") {
                    //   widget.networkService
                    //       .getRecordById(widget.networkID)
                    //       .then((value) => openDialog(
                    //           value.percentage.toString(),
                    //           value.goal.toString(),
                    //           "CAL",
                    //           '${widget.ID}',
                    //           '${widget.cardName}'));
                    // } else if (widget.cardName == "Fuel") {
                    //   widget.fuelService.getRecordById(widget.fuelID).then(
                    //       (value) => openDialog(
                    //           value.percentage.toString(),
                    //           value.goal.toString(),
                    //           "CAL",
                    //           '${widget.ID}',
                    //           '${widget.cardName}'));
                    // } else if (widget.cardName == "Productivity") {
                    //   widget.productivityService
                    //       .getRecordById(widget.productivityID)
                    //       .then((value) => openDialog(
                    //           value.percentage.toString(),
                    //           value.goal.toString(),
                    //           "CAL",
                    //           '${widget.ID}',
                    //           '${widget.cardName}'));
                    // }
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
        // TODO: Need to do error handeling for empty feilds.
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Goal Info:"),
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
                  double _progress =
                      double.parse(widget.updatedPercentage.text);
                  double _goal = double.parse(widget.updatedGoal.text);
                  _updatedSpecificGoal(_goal, _progress);

                  Navigator.of(context).pop();
                },
                child: Text('Update Goals')),
          ],
        ),
      );

  void _updatedSpecificGoal(_goal, _progress) async {
    if (widget.cardName == "Recovery") {
      //   await widget.recoveryService.resetGoal(widget.recoveryID, _goal);
      //   widget.recoveryService.updateProgress(widget.recoveryID, _progress);
      // } else if (widget.cardName == "Fitness") {
      //   await widget.fitnessService.resetGoal(widget.fitnessID, _goal);
      //   widget.fitnessService.updateProgress(widget.fitnessID, _progress);
      // } else if (widget.cardName == "Network") {
      //   await widget.networkService.resetGoal(widget.networkID, _goal);
      //   widget.networkService.updateProgress(widget.networkID, _progress);
      // } else if (widget.cardName == "Fuel") {
      //   await widget.fuelService.resetGoal(widget.fuelID, _goal);
      //   widget.fuelService.updateProgress(widget.fuelID, _progress);
      // } else if (widget.cardName == "Productivity") {
      //   await widget.productivityService.resetGoal(widget.productivityID, _goal);
      //   widget.productivityService
      //       .updateProgress(widget.productivityID, _progress);
      // }
    }
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
