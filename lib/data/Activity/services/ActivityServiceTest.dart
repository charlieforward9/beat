//Copied from time_budget_widget

//  void createGoal() async {
//   int hours = 10, minutes = 10, seconds = 10;
//   String userId = await widget.userService.getUserId("cameron@keenefl.com");

//   //widget.goalService.createGoal(CategoryTypes.REST, userId, hours, minutes, seconds);
// }

// Future<void> createActivity() async {
//   String userID = await widget.userService.getUserId("cameron@keenefl.com");
//   DateTime date = DateTime.now();
//   String goalID =
//       await widget.goalService.getGoalId(CategoryTypes.REST, userID, date);
//   //print(testGoalID);
//   widget.activityService.createRecord(CategoryTypes.REST, goalID, 1, 1, 1);
//   // link activity to goal
//   DurationBeat _duration =
//       DurationBeat(durationHours: 4, durationMinutes: 0, durationSeconds: 0);
//   //widget.goalService.updateGoalDuration(CategoryTypes.REST, userID, date, _duration);
//   // update the goal percentage
// }

// Future<void> updateActivityCategoryTester(CategoryTypes _newCategory) async {
//   // Working
//   String _activityId = "d3de16cd-89d7-40f2-bb27-34392de557c3";
//   widget.activityService.updateActivityCategory(_newCategory, _activityId);
// }

// Future<void> updateActivityDurationTester(
//     String _activityId,
//     // working
//     int _newHours,
//     int _newMinutes,
//     int _newSeconds) async {
//   //String _activityId = "d3de16cd-89d7-40f2-bb27-34392de557c3";
//   DurationBeat newDuration = DurationBeat(
//       durationHours: _newHours,
//       durationMinutes: _newMinutes,
//       durationSeconds: _newSeconds);
//   widget.activityService.updateActivityDuration(_activityId, newDuration);
// }

// Future<void> getActivityStartTester(String _activityId) async {
//   widget.activityService.getActivityStart(_activityId).then((value) {
//     print("getActivityStartTester: $value");
//   });
// }

// Future<void> getActivityEndTester(String _activityId) async {
//   widget.activityService.getActivityEnd(_activityId).then((value) {
//     print("getActivityEndTester: $value");
//   });
// }

// Future<void> getActivityCategoryTester(String _activityId) async {
//   widget.activityService.getActivityCategory(_activityId).then((value) {
//     print("getActivityCategoryTester: $value");
//   });
// }

// Future<void> getActivityDurationTester(String _activityId) async {
//   widget.activityService.getActivityDuration(_activityId).then((value) {
//     print("getActivityDurationTester: $value");
//   });
// }

// Future<void> getGoalIdTester(String _activityId) async {
//   widget.activityService.getGoalId(_activityId).then((value) {
//     print("getGoalIdTester: $value");
//   });
// }

// Future<void> getActivityIdTester(String _activityId) async {
//   widget.activityService.getActivityId(_activityId).then((value) {
//     print("getActivityIdTester: $value");
//   });
// }

// void getGoalIDTester() async {
//   String userID = await widget.userService.getUserId("cameron@keenefl.com");
//   DateTime date = DateTime.now();
//   String goalID = "f6ec4ce9-8e0a-499d-936c-55e75ba8c3a6";
//   // TODO: goalService.getGoalId not returning everything properly.

//   final testGoalID =
//       await widget.goalService.getGoalId(CategoryTypes.FITNESS, userID, date);
//   print(testGoalID);
// }