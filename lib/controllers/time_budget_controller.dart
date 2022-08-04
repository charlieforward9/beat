//IMPORT STATEMENT SHOULD LOOK LIKE THIS
//import '<PATH>' as TimeBudgetController;
import 'dart:developer';

// import data models
import '../models/ModelProvider.dart';

// service imports
import '../data/Activity/services/ActivityService.dart';
import '../data/Goal/services/GoalService.dart';
import '../data/Metrics/repository/MetricRepository.dart';
import '../data/User/services/UserService.dart';

// testing global
import '../global.dart' as globalTest;

GoalService goalService = GoalService();

Future<Goal> getGoal() async {
  @override
  String userID = globalTest.currentUser.id;
  CategoryTypes tmp = CategoryTypes.FITNESS;
  Goal tempGoal = await goalService.getGoal(userID, tmp, null);
  String goalID = tempGoal.getId();
  print("Testing GoalID: $goalID");
  return tempGoal;
}

// TODO: Make function to return Stirng of type from CategoryTypes



// class TimeBudgetController {
//   //TODO: Add functions

//   // make repository for all services
//   ActivityService activityService = ActivityService();
//   GoalService goalService = GoalService();
//   MetricRepository metricService = MetricRepository();
//   UserService userService = UserService("charlesrichardsonusa@gmail.com");

//   /*
//     Things to add
//     - get specific user goal
//     - get specific user percentage
//     - update specific user goal
//     - update specific user percentage


//   */

//   void _updatedSpecificGoal(_cardName, _goal, _progress) async {
//     if (_cardName == "Recovery") {
//       log(globalTest.currentUser.toString());
//     }
//   }

//   Future<List<Goal>> logOnlyLatestGoals() async {
//     final List<CategoryTypes> _allCategories = CategoryTypes.values;
//     String testUserID =
//         await userService.getUserId("charlesrichardsonusa@gmail.com");
//     //String testUserID = globalTest.currentUser.id;
//     List<Goal> storage = [];

//     // get latest goal in each category
//     for (var cat in _allCategories) {
//       // when the timestamp is null, the latest goal is pulled
//       Goal temp = await goalService.getGoal(testUserID, cat, null);
//       String goalID = temp.getId();
//       storage.add(temp);
//       print("Goal ID: $goalID");
//       //getGoal(testUserID, cat, null);
//     }
//     // return storage;
//     return Future.delayed(
//         const Duration(seconds: 2), () => Future<List<Goal>>.value(storage));
//   }
// }
