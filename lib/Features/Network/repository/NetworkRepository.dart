import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class NetworkRepository{

  Future<void> newNetworkRecord() async {
    final newRecord= Network(
      percentage: 0,
      goal: 100,
    );
    await Amplify.DataStore.save(newRecord);
  }

  Future<void> updateNetworkPercentage(String id, double newPercentage) async {
    final recordWithId = await Amplify.DataStore.query(
      Network.classType,
      where: Network.ID.eq(id),
    );

    final oldRecord = recordWithId.first;
    final newRecordPercenatge = oldRecord.copyWith(id: oldRecord.id, percentage: newPercentage);

    await Amplify.DataStore.save(newRecordPercenatge);
  }

  Future<void> updateNetworkGoal(String id, double newGoal) async {
    final recordWithId = await Amplify.DataStore.query(
      Productivity.classType,
      where: Productivity.ID.eq(id),
    );

    final oldRecord = recordWithId.first;
    final newRecordGoal = oldRecord.copyWith(id: oldRecord.id, goal: newGoal);

    await Amplify.DataStore.save(newRecordGoal);
  }
}
