import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class FuelRepository{

  Future<void> newFuelRecord() async {
    final newRecord= Fuel(
      percentage: 0,
      goal: 100,
    );
    await Amplify.DataStore.save(newRecord);
  }

  Future<Fuel> getRecordById(String id) async {
    final recordWithId = await Amplify.DataStore.query(
      Fuel.classType,
      where: Fuel.ID.eq(id),
    );
    return recordWithId.first;
  }

  Future<void> updateFuelPercentage(String id, double newPercentage) async {
    Fuel oldRecord = await getRecordById(id);
    final newRecordPercenatge = oldRecord.copyWith(id: oldRecord.id, percentage: newPercentage);

    await Amplify.DataStore.save(newRecordPercenatge);
  }

  Future<void> updateFuelGoal(String id, double newGoal) async {
    Fuel oldRecord = await getRecordById(id);
    final newRecordGoal = oldRecord.copyWith(id: oldRecord.id, goal: newGoal);

    await Amplify.DataStore.save(newRecordGoal);
  }
}
