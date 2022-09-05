import 'dart:convert';
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

Future<Map<String, dynamic>> createWeFitterProfile(adminBearer) async {
  //returns map with profile information
  var headers = {
    'Authorization': 'Bearer $adminBearer',
    'Cookie': 'SERVERID=s4'
  };
  var body = {
    'given_name': 'string',
    'family_name': 'string',
    'nickname': 'string',
    'gender': 'M',
    'birthdate': '2022-09-02',
    'locale': 'EN-us', //TODO : automate setting of location
    'reference': 'string',
    'avatar':
        'https://www.google.com/imgres?imgurl=https%3A%2F%2Fnews.yale.edu%2Fsites%2Fdefault%2Ffiles%2Fstyles%2Ffeatured_media%2Fpublic%2Fadobestock_247791659-ynews-cc.jpg%3Fitok%3DQBjU78nw%26c%3D07307e7d6a991172b9f808eb83b18804&imgrefurl=https%3A%2F%2Fnews.yale.edu%2F2020%2F01%2F28%2Ftiny-salamanders-huge-genome-may-harbor-secrets-regeneration&tbnid=zXYayC55n_dnMM&vet=12ahUKEwjvv_TNrPf5AhUeRFMKHVmQCRoQMygFegUIARDnAQ..i&docid=MZkk-NldV1OabM&w=1022&h=594&q=salamander&ved=2ahUKEwjvv_TNrPf5AhUeRFMKHVmQCRoQMygFegUIARDnAQ'
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
