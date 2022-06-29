import 'package:beat/Recovery/models/sleep_widget_model.dart';
import 'package:http/http.dart' as http;
import 'Constants.dart';
import 'dart:convert';


class HttpService {
  Future<SleepWidgetModel> fetchData() async {
    final response = await http.get(Uri.parse('${(apiUrl)}'));
    if (response.statusCode == 200) {
      print(response.body);
      return SleepWidgetModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load DemoAPI');
    }
  }


  Future<SleepWidgetModel> addData(String name,String percentage) async {
    final response = await http.post(
    Uri.parse('${(apiUrl)}'),  
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, 
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'percentage': percentage,
      }),
    );

    if (response.statusCode == 201) {
      print(response.body);
      return SleepWidgetModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load DemoAPI');
    }
  }
}