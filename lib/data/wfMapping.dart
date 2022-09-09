import 'dart:convert';
import 'dart:developer';

import 'package:beat/data/Goal/services/GoalService.dart';
import 'package:beat/global.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:http/http.dart' as http;
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

Future<void> weFitterTestSequencePart1() async {
  try {
    print("Getting admin bearer token");
    String adminBearer = await getAdminBearerToken();
    print("Admin bearer token $adminBearer");
    print("Creating and integrating the WF profile with BEAT");
    Integrations? ints = await integrateWFProfile(adminBearer);
    print("Integrations Type loaded as $ints");
    print("preparing a connection url for use");
    Uri? uri = await requestConnectionURL();
    uri == null ? connectionUri = uri! : print("The connectionUri is null");
    print("Uri is $uri");
  } catch (e) {
    log("$e");
  }
}

Future<void> weFitterTestSequencePart2() async {
  try {
    print("Mapping the workouts of the profile to Beat activities");
    await mapWFWorkoutToBeatActivity();
    print("Success");
  } catch (e) {
    log("$e");
  }
}

Future<String> getAdminBearerToken() async {
  //returns bearerAdmin token
  String username = '67edf2af-9422-47ad-8cf5-f67f060df7dd';
  String password = 'mpXcxLofQyNCtofqP11r9WqwHTSZWQ3R';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  final response = await http.post(
      Uri.https('api.wefitter.com', '/api/v1.3/token/'),
      headers: <String, String>{'authorization': basicAuth});

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    var bearerToken = jsonResponse['bearer'];
    return bearerToken;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return Exception(response.body).toString();
  }
}

Future<Integrations?> integrateWFProfile(adminBearer) async {
  //returns map with profile information

  var headers = {
    'Authorization': 'Bearer $adminBearer',
    'Cookie': 'SERVERID=s4'
  };
  var body = {
    'given_name': currentUser.userFirstName,
    'family_name': currentUser.userLastName,
    'nickname': currentUser.userName,
    'gender': currentUser.userGender,
    'birthdate': currentUser.userBirthDate,
    'locale': findSystemLocale(),
    'reference': currentUser.id,
    'avatar': currentUser.userAvatar
  };

  final response = await http.post(
      Uri.https('api.wefitter.com', '/api/v1.3/profile/'),
      headers: headers,
      body: body);

  if (response.statusCode == 201) {
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    final userInts = Integrations(
        wf_public_id: jsonResponse['public_id'],
        wf_profile_bearer: jsonResponse['bearer']);
    await Amplify.DataStore.save(userInts);

    final updatedUser = currentUser.copyWith(userIntegrations: userInts);
    await Amplify.DataStore.save(updatedUser);
    return userInts;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    Exception(response.body);
    return null;
  }
}

Future<Uri?> requestConnectionURL() async {
  var headers = {
    'Authorization':
        'Bearer ${currentUser.userIntegrations?.wf_profile_bearer}',
  };
  final response = await http.get(
      Uri.https('api.wefitter.com',
          '/api/v1.3/profile/${currentUser.userIntegrations?.wf_public_id}/connections'),
      headers: headers);
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return Uri.parse(jsonResponse['url'].toString());
  } else {
    print('Request failed with status: ${response.statusCode}.');
    Exception(response.body);
    return null;
  }
}

//Assumes User Integrations are connected
Future<List<Map<String, dynamic>>> requestWFWorkouts() async {
  var headers = {
    'Authorization':
        'Bearer ${currentUser.userIntegrations?.wf_profile_bearer}',
  };
  final response = await http.get(
      Uri.https('api.wefitter.com',
          '/api/v1.3/profile/${currentUser.userIntegrations?.wf_public_id}/workouts'),
      headers: headers);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}.');
    Exception(response.body);
    return [];
  }
}

Future<void> mapWFWorkoutToBeatActivity() async {
  final workouts = await requestWFWorkouts();
  var workoutCount = 0;
  for (var workout in workouts) {
    var _utcStart =
        TemporalDateTime.fromString(workout["timestamp"].toString());
    var _utcStartDate = TemporalDate(DateTime.parse(
        DateFormat('yyyy-MM-dd').format(DateTime.parse(workout["timestamp"]))));
    var _localStart = DateTime.parse(workout["timestamp"].toString())
        .toLocal()
        .toIso8601String();
    var _category = CategoryTypes.FITNESS;
    var _duration = DurationBeat(
        durationSeconds: _toDuration(workout["duration"]).inSeconds);
    var _goal = await GoalService()
        .getGoal(currentUser.id, CategoryTypes.FITNESS, _utcStartDate);
    //TODO Handle the metrics that come from WeFitter
    var _goalId = _goal.id;

    var activity = Activity(
        utcStart: _utcStart,
        localStart: _localStart,
        activtyCategory: _category,
        activityDuration: _duration,
        howToGetG: _goalId,
        activityOfGoal: _goal);

    Amplify.DataStore.save(activity);
    workoutCount++;
  }
  log("$workoutCount Workouts Mapped to Activities");
}

//credit to https://dev.to/ashishrawat2911/parse-iso8601-duration-string-to-duration-object-in-dart-flutter-1gc1
Duration _toDuration(String isoString) {
  if (!RegExp(
          r"^(-|\+)?P(?:([-+]?[0-9,.]*)Y)?(?:([-+]?[0-9,.]*)M)?(?:([-+]?[0-9,.]*)W)?(?:([-+]?[0-9,.]*)D)?(?:T(?:([-+]?[0-9,.]*)H)?(?:([-+]?[0-9,.]*)M)?(?:([-+]?[0-9,.]*)S)?)?$")
      .hasMatch(isoString)) {
    throw ArgumentError("String does not follow correct format");
  }

  final weeks = _parseTime(isoString, "W");
  final days = _parseTime(isoString, "D");
  final hours = _parseTime(isoString, "H");
  final minutes = _parseTime(isoString, "M");
  final seconds = _parseTime(isoString, "S");

  return Duration(
    days: days + (weeks * 7),
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  );
}

//credit to https://dev.to/ashishrawat2911/parse-iso8601-duration-string-to-duration-object-in-dart-flutter-1gc1
/// Private helper method for extracting a time value from the ISO8601 string.
int _parseTime(String duration, String timeUnit) {
  final timeMatch = RegExp(r"\d+" + timeUnit).firstMatch(duration);

  if (timeMatch == null) {
    return 0;
  }
  final timeString = timeMatch.group(0);
  return int.parse(timeString!.substring(0, timeString.length - 1));
}
