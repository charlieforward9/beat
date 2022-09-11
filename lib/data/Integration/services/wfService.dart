import 'dart:convert';
import 'dart:developer';

import 'package:beat/config/locale_config.dart';
import 'package:beat/data/Activity/services/ActivityService.dart';
import 'package:beat/data/DateTimeService.dart';
import 'package:beat/data/Goal/services/GoalService.dart';
import 'package:beat/config/global.dart';
import 'package:beat/data/Integration/services/IntegrationServices.dart';
import 'package:beat/data/User/services/UserService.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:intl/intl.dart';

class WFService {
  //Gets the token that allows for profile creation
  Future<String> requestAdminBearerToken() async {
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
      log('Request failed with status: ${response.statusCode}.');
      return Exception(response.body).toString();
    }
  }

  //Response of creating a new profile with information relevant to the user and integrations models
  Future<Map<String, dynamic>?> createProfile(adminBearer) async {
    var headers = {
      'Authorization': 'Bearer $adminBearer',
      'Cookie': 'SERVERID=s4'
    };
    var body = {
      'given_name': currentUser.userFirstName,
      'family_name': currentUser.userLastName,
      'nickname': currentUser.userName,
      'gender': currentUser.userGender.name,
      'birthdate': currentUser.userBirthDate.toString(),
      'locale':
          "${supportedLocales[0].languageCode}-${supportedLocales[0].languageCode}",
      'reference': currentUser.id,
      'avatar': currentUser.userAvatar
    };

    final response = await http.post(
        Uri.https('api.wefitter.com', '/api/v1.3/profile/'),
        headers: headers,
        body: body);

    if (response.statusCode == 201) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      log('Request failed with status: ${response.statusCode}\n ${Exception(response.body)}',
          name: "integrateWFProfile Failed");
      return null;
    }
  }

  //Returns the URLs of the connections the user is able to integrate with
  //ONLY RETURNS THE FIRST CONNECTION RIGHT NOW (STRAVA)
  Future<Uri?> requestConnectionURL() async {
    var headers = {
      'Authorization': 'Bearer ${currentUserIntegrations.wf_profile_bearer}',
    };
    final response = await http.get(
        Uri.https('api.wefitter.com',
            '/api/v1.3/profile/${currentUserIntegrations.wf_public_id}/connections'),
        headers: headers);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body)[0];

      return Uri.parse((jsonResponse['url']).toString());
    } else {
      log('Request failed with status: ${response.statusCode}\n ${Exception(response.body)}',
          name: "requestConnectionURL Failed");
      return null;
    }
  }

//Assumes User Integrations are connected
  Future<dynamic> requestWFWorkouts() async {
    var headers = {
      'Authorization': 'Bearer ${currentUserIntegrations.wf_profile_bearer}',
    };
    final response = await http.get(
        Uri.https('api.wefitter.com',
            '/api/v1.3/profile/${currentUserIntegrations.wf_public_id}/workout'),
        headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      log('Request failed with status: ${response.statusCode}\n ${Exception(response.body)}',
          name: "requestWFWorkouts Failed");
      return {};
    }
  }

  //Takes the response from the createProfile function and saves/updates the currentUser with the details
  Future<void> integrateUser(_profileResponse) async {
    currentUserIntegrations = Integrations(
        wf_public_id: _profileResponse['public_id'],
        wf_profile_bearer: _profileResponse['bearer']);
    final updatedUser = currentUser.copyWith(
        userUserIntegrationsId: currentUserIntegrations.id);

    await IntegrationService().createIntegration(currentUserIntegrations);
    await UserService().updateUser(updatedUser);
  }

//Calls WF workout endpoint and turns each returned instance into a beat
//activity, given a goal exists on the date the workout was completed
//CURRENTLY LIMITED TO THE LAST ~45 WORKOUTS
  Future<void> mapWFWorkoutToBeatActivity() async {
    const _cat = CategoryTypes.FITNESS;
    final workouts = await requestWFWorkouts();

    var workoutCount = 0;
    for (var workout in workouts) {
      //Variables from response
      var timestamp = workout["timestamp"].toString();
      var duration = workout["duration"];

      //Response variables casted to their respective types
      var _utc = TemporalDateTime.fromString(timestamp);
      var _utcDate = TemporalDate(DateTime.parse(
          DateFormat('yyyy-MM-dd').format(DateTime.parse(timestamp))));
      var _local = DateTime.parse(timestamp).toLocal().toIso8601String();
      var _dur =
          DurationBeat(seconds: DTService().toDuration(duration).inSeconds);
      try {
        Goal _goal =
            await GoalService().getGoal(currentUser.id, _cat, _utcDate);
        String? _goalId = _goal.id;
        if (await ActivityService().isDuplicate(_goalId, _local)) {
        } else {
          ActivityService().createActivity(_local, _utc, _cat, _dur, _goalId);
          workoutCount++;
        }
      } catch (e) {
        debugPrint("A goal does not exist for this activity date");
        continue;
      }
    }
    log("$workoutCount Workouts Mapped to Activities");
  }
}
