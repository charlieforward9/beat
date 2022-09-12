import 'package:amplify_flutter/amplify_flutter.dart';

class DTService {
  late DateTime _now;
  late TemporalDate utcD;
  late TemporalDateTime utcDT;
  late String localD;
  late String localDT;

  DTService() {
    _now = DateTime.now();
    utcD = TemporalDate(_now);
    utcDT = TemporalDateTime(_now);
    localD = _now.toIso8601String().substring(0, 10);
    localDT = _now.toIso8601String();
  }

  //shoutout https://dev.to/ashishrawat2911/parse-iso8601-duration-string-to-duration-object-in-dart-flutter-1gc1
  //Converts iso8601 duration string into usable dur
  Duration toDuration(String isoString) {
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

  /// Private helper method for extracting a time value from the ISO8601 string.
  int _parseTime(String duration, String timeUnit) {
    final timeMatch = RegExp(r"\d+" + timeUnit).firstMatch(duration);

    if (timeMatch == null) {
      return 0;
    }
    final timeString = timeMatch.group(0);
    return int.parse(timeString!.substring(0, timeString.length - 1));
  }
}
