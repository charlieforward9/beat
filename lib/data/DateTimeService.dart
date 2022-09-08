import 'package:amplify_flutter/amplify_flutter.dart';

class DTService {
  late DateTime _now;
  late TemporalDate utcD;
  late TemporalDateTime utcDT;
  late String localD;
  late String localDT;

  DTService() {
    _now = DateTime.now().add(Duration(days: 1));
    utcD = TemporalDate(_now);
    utcDT = TemporalDateTime(_now);
    localD = _now.toIso8601String().substring(0, 10);
    localDT = _now.toIso8601String();
  }
}
