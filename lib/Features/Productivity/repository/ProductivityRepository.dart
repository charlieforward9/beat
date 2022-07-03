import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class ProductivityRepository{

  Future<void> newProductivityRecord() async {
    final newRecord= Productivity(
      percentage: 0,
      goal: 100,
    );
    await Amplify.DataStore.save(newRecord);
  }

  Future<void> updateProductivityPercentage(String id, double newPercentage) async {
    final recordWithId = await Amplify.DataStore.query(
      Productivity.classType,
      where: Productivity.ID.eq(id),
    );

    final oldRecord = recordWithId.first;
    final newRecordPercenatge = oldRecord.copyWith(id: oldRecord.id, percentage: newPercentage);

    await Amplify.DataStore.save(newRecordPercenatge);
  }

  Future<void> updateProductivityGoal(String id, double newGoal) async {
    final recordWithId = await Amplify.DataStore.query(
      Productivity.classType,
      where: Productivity.ID.eq(id),
    );

    final oldRecord = recordWithId.first;
    final newRecordGoal = oldRecord.copyWith(id: oldRecord.id, goal: newGoal);

    await Amplify.DataStore.save(newRecordGoal);
  }
}
