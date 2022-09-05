import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class DTB {
  late DateTime _now;
  late DateTimeBeat _dtb;

  DTB() {
    _now = DateTime.now();
    _dtb = DateTimeBeat(
        utc: TemporalDateTime(_now), local: _now.toIso8601String());
  }

  saveEntity() async {
    _now = DateTime.now();
    _dtb = DateTimeBeat(
        utc: TemporalDateTime(_now), local: _now.toIso8601String());
    final testEntity = TestEntity(timeType: _dtb);
    print("Saving test entity $testEntity\n");
    try {
      await Amplify.DataStore.save(testEntity);
    } catch (e) {
      print(e);
    }
  }

  getEntity() async {
    List<TestEntity> response =
        await Amplify.DataStore.query(TestEntity.classType);
    var result = response.first;
    print(
        '\nutc: ${result.timeType?.utc.toString()}\nlocal: ${result.timeType?.local}');
  }
}
