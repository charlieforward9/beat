//TODO ERRORS COMING FROM THIS FILE IN REGARDS TO ACTIVITYSERVICE - WILL FIX


// import 'package:beat/Features/User/services/UserService.dart';
// import 'package:beat/models/ModelProvider.dart';
// import 'package:flutter/material.dart';


// import '../../Features/Goal/services/GoalService.dart';
// import '../../Features/User/services/UserService.dart';
// import '../../Features/Activity/services/ActivityService.dart';

// // sleep
// import 'dart:io';

// class GoalCard extends StatefulWidget {
//   final String cardName;
//   final String cardGoal;
//   final Color passedColor;

//   final TextEditingController updatedGoal = TextEditingController();
//   final TextEditingController updatedPercentage = TextEditingController();


//   GoalService goalService = GoalService();
//   UserService userService = UserService("charlesrichardsonusa@gmail.com");




//   GoalCard(
//       {Key? key,
//       required this.cardName,
//       required this.cardGoal,
//       required this.passedColor})
//       : super(key: key);

//   @override
//   State<GoalCard> createState() => _GoalCardState();
// }

// class _GoalCardState extends State<GoalCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         color: widget.passedColor,
//         child: InkWell(
//           splashColor: Colors.blue.withAlpha(30),
//           onTap: () {
//             debugPrint('Card tapped - Goal Card.');
//           },
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width - 15,
//             height: MediaQuery.of(context).size.height / 12,
//             child: Center(
//                 child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 SizedBox(width: 5),
//                 Expanded(child: Text('${widget.cardName}')),
//                 //SizedBox(width: 25),
//                 Expanded(flex: 1, child: Text('${widget.cardGoal}')),
//                 //Spacer(),
//                 TextButton.icon(
//                   onPressed: () async {
//                     String _activityId = "d3de16cd-89d7-40f2-bb27-34392de557c3";
//                     //createGoal();
//                     //getGoalIDTester();
//                     //await createActivity();
//                     //updateGoal();
//                     //updateActivityCategoryTester(CategoryTypes.FITNESS);
//                     //updateActivityDurationTester(_activityId, 69, 69, 69);
//                     //getActivityStartTester(_activityId);
//                     //getActivityEndTester(_activityId);
//                     //getActivityCategoryTester(_activityId);
//                     //getActivityDurationTester(_activityId);
//                     //getGoalIdTester(_activityId);
//                     //getActivityIdTester(_activityId);
//                   },
//                   icon: Icon(Icons.create_sharp, size: 18),
//                   label: Text(""),
//                 )
//               ],
//             )),
//           ),
//         ),
//       ),
//     );
//   }

//   Future openDialog(_percentage, _goal, _metric, _id, _type) => showDialog(
//         // TODO: Need to do error handeling for empty feilds.
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text("Goal Info:"),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text("Goal: "),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: _goal,
//                     floatingLabelBehavior: FloatingLabelBehavior.always,
//                   ),
//                   controller: widget.updatedGoal,

//                   //initialValue: _goal,
//                 ),
//                 Text("Percentage: "),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: _percentage,
//                     floatingLabelBehavior: FloatingLabelBehavior.always,
//                   ),
//                   controller: widget.updatedPercentage,
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Update Goals')),
//           ],
//         ),
//       );

//   void _updatedSpecificGoal(_goal, _progress) async {
//     if (widget.cardName == "Recovery") {
//       //   await widget.recoveryService.resetGoal(widget.recoveryID, _goal);
//       //   widget.recoveryService.updateProgress(widget.recoveryID, _progress);
//       // } else if (widget.cardName == "Fitness") {
//       //   await widget.fitnessService.resetGoal(widget.fitnessID, _goal);
//       //   widget.fitnessService.updateProgress(widget.fitnessID, _progress);
//       // } else if (widget.cardName == "Network") {
//       //   await widget.networkService.resetGoal(widget.networkID, _goal);
//       //   widget.networkService.updateProgress(widget.networkID, _progress);
//       // } else if (widget.cardName == "Fuel") {
//       //   await widget.fuelService.resetGoal(widget.fuelID, _goal);
//       //   widget.fuelService.updateProgress(widget.fuelID, _progress);
//       // } else if (widget.cardName == "Productivity") {
//       //   await widget.productivityService.resetGoal(widget.productivityID, _goal);
//       //   widget.productivityService
//       //       .updateProgress(widget.productivityID, _progress);
//       // }
//     }
//   }

//   void createGoal() async {
//     int hours = 10, minutes = 10, seconds = 10;
//     String userId = await widget.userService.getUserId("cameron@keenefl.com");

//     //widget.goalService.createGoal(CategoryTypes.REST, userId, hours, minutes, seconds);
//   }

//   Future<void> createActivity() async {
//     String userID = await widget.userService.getUserId("cameron@keenefl.com");
//     DateTime date = DateTime.now();
//     String goalID =
//         await widget.goalService.getGoalId(CategoryTypes.REST, userID, date);
//     //print(testGoalID);
//     widget.activityService.createRecord(CategoryTypes.REST, goalID, 1, 1, 1);
//     // link activity to goal
//     DurationBeat _duration =
//         DurationBeat(durationHours: 4, durationMinutes: 0, durationSeconds: 0);
//     //widget.goalService.updateGoalDuration(CategoryTypes.REST, userID, date, _duration);
//     // update the goal percentage
//   }

//   Future<void> updateActivityCategoryTester(CategoryTypes _newCategory) async {
//     // Working
//     String _activityId = "d3de16cd-89d7-40f2-bb27-34392de557c3";
//     widget.activityService.updateActivityCategory(_newCategory, _activityId);
//   }

//   Future<void> updateActivityDurationTester(
//       String _activityId,
//       // working
//       int _newHours,
//       int _newMinutes,
//       int _newSeconds) async {
//     //String _activityId = "d3de16cd-89d7-40f2-bb27-34392de557c3";
//     DurationBeat newDuration = DurationBeat(
//         durationHours: _newHours,
//         durationMinutes: _newMinutes,
//         durationSeconds: _newSeconds);
//     widget.activityService.updateActivityDuration(_activityId, newDuration);
//   }

//   Future<void> getActivityStartTester(String _activityId) async {
//     widget.activityService.getActivityStart(_activityId).then((value) {
//       print("getActivityStartTester: $value");
//     });
//   }

//   Future<void> getActivityEndTester(String _activityId) async {
//     widget.activityService.getActivityEnd(_activityId).then((value) {
//       print("getActivityEndTester: $value");
//     });
//   }

//   Future<void> getActivityCategoryTester(String _activityId) async {
//     widget.activityService.getActivityCategory(_activityId).then((value) {
//       print("getActivityCategoryTester: $value");
//     });
//   }

//   Future<void> getActivityDurationTester(String _activityId) async {
//     widget.activityService.getActivityDuration(_activityId).then((value) {
//       print("getActivityDurationTester: $value");
//     });
//   }

//   Future<void> getGoalIdTester(String _activityId) async {
//     widget.activityService.getGoalId(_activityId).then((value) {
//       print("getGoalIdTester: $value");
//     });
//   }

//   Future<void> getActivityIdTester(String _activityId) async {
//     widget.activityService.getActivityId(_activityId).then((value) {
//       print("getActivityIdTester: $value");
//     });
//   }

//   // void updateGoal() async {
//   //   String userID = await widget.userService.getUserId("cameron@keenefl.com");
//   //   DateTime date = DateTime.now();
//   //   DurationBeat _duration = DurationBeat(
//   //       durationHours: 4, durationMinutes: 11, durationSeconds: 11);
//   //   widget.goalService
//   //       .updateGoalDuration(CategoryTypes.REST, userID, date, _duration);
//   // }

//   void getGoalIDTester() async {
//     String userID = await widget.userService.getUserId("cameron@keenefl.com");
//     DateTime date = DateTime.now();
//     String goalID = "f6ec4ce9-8e0a-499d-936c-55e75ba8c3a6";
//     // TODO: goalService.getGoalId not returning everything properly.

//     final testGoalID =
//         await widget.goalService.getGoalId(CategoryTypes.FITNESS, userID, date);
//     print(testGoalID);
//   }

//   // void updateGoalDurationTester() async {
//   //   String userID = await widget.userService.getUserId("cameron@keenefl.com");
//   //   DateTime date = DateTime.now();
//   //   String goalID =
//   //       await widget.goalService.getGoalId(CategoryTypes.FITNESS, userID, date);
//   //   // link activity to goal
//   //   DurationBeat _duration =
//   //       DurationBeat(durationHours: 4, durationMinutes: 0, durationSeconds: 0);
//   //   widget.goalService.updateGoalDurationOnGoalId(goalID, _duration);
//   // }

// class ButtonRow extends StatefulWidget {
//   final buttonOneName;
//   final buttonTwoName;
//   const ButtonRow({
//     Key? key,
//     required this.buttonOneName,
//     required this.buttonTwoName,
//   }) : super(key: key);

//   @override
//   State<ButtonRow> createState() => _ButtonRowState();
// }

// class _ButtonRowState extends State<ButtonRow> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(width: 25),
//         Expanded(
//             child: ElevatedButton(
//                 onPressed: () {
//                   // Respond to button press
//                 },
//                 child: Text('${widget.buttonOneName}'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepOrangeAccent,
//                 ))),
//         SizedBox(width: 25),
//         Expanded(
//             child: ElevatedButton(
//                 onPressed: () {
//                   // Respond to button press
//                 },
//                 child: Text('${widget.buttonTwoName}'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepOrangeAccent,
//                 ))),
//         SizedBox(width: 25),
//       ],
//     );
//   }
// }
