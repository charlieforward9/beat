import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class FitnessRepository{

  Future<void> newFitnessRecord() async {
    final newRecord= Fitness(
      percentage: 0,
      goal: 100,
    );
    await Amplify.DataStore.save(newRecord);
  }

  Future<Fitness> getRecordById(String id) async {
    final recordWithId = await Amplify.DataStore.query(
      Fitness.classType,
      where: Fitness.ID.eq(id),
    );
    return recordWithId.first;
  }

  Future<void> updateFitnessPercentage(String id, double newPercentage) async {
    Fitness oldRecord = await getRecordById(id);
    final newRecordPercenatge = oldRecord.copyWith(id: oldRecord.id, percentage: newPercentage);

    await Amplify.DataStore.save(newRecordPercenatge);
  }

  Future<void> updateFitnessGoal(String id, double newGoal) async {
    Fitness oldRecord = await getRecordById(id);
    final newRecordGoal = oldRecord.copyWith(id: oldRecord.id, goal: newGoal);

    await Amplify.DataStore.save(newRecordGoal);
  }
}