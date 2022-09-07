import 'dart:convert';
import 'package:beat/models/ModelProvider.dart';
import 'package:http/http.dart' as http;

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
    print(
        'Request failed with status: ${response.statusCode}.'); //TODO: debug print instead of print
    return "0";
  }
}

Future<Map<String, dynamic>> createWeFitterProfile(
    adminBearer, User user) async {
  //returns map with profile information
  var headers = {
    'Authorization': 'Bearer $adminBearer',
    'Cookie': 'SERVERID=s4'
  };
  var body = {
    'given_name': user.userFirstName,
    'family_name': user.userLastName,
    'nickname': user.userName,
    'gender': user.userGender,
    'birthdate': '2022-09-02', //TODO: string manipulate
    'locale': 'EN-us', //TODO : automate setting of location
    'reference': user.id,
    'avatar': user.userAvatar
  };

  final response = await http.post(
      Uri.https('api.wefitter.com', '/api/v1.3/profile/'),
      headers: headers,
      body: body);

  if (response.statusCode == 201) {
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    var bearerToken = jsonResponse['bearer'];
    return jsonResponse;
  } else {
    return {};
  }
}
