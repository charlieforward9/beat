import 'package:beat/Features/Recovery/models/Recovery.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class RecoveryRepository{

  Future<void> newRecoveryRecord() async {
    final newRecoveryRecord = Recovery(
      percentage: 0,
      goal: 100,
    );
    await Amplify.DataStore.save(newRecoveryRecord);
  }

  Future<Recovery> getRecordById(String id) async {
    final recoveryRecordWithId = await Amplify.DataStore.query(
      Recovery.classType,
      where: Recovery.ID.eq(id),
    );
    return recoveryRecordWithId.first;
  }

  Future<void> updateRecoveryPercentage(String id, double newPercentage) async {
    Recovery oldRecoveryRecord = await getRecordById(id);
    final newRecoveryRecordPercenatge = oldRecoveryRecord.copyWith(id: oldRecoveryRecord.id, percentage: newPercentage);
    
    await Amplify.DataStore.save(newRecoveryRecordPercenatge);
  }

  Future<void> updateRecoveryGoal(String id, double newGoal) async {
    Recovery oldRecoveryRecord = await getRecordById(id);
    final newRecoveryRecordGoal = oldRecoveryRecord.copyWith(id: oldRecoveryRecord.id, goal: newGoal);

    await Amplify.DataStore.save(newRecoveryRecordGoal);
  }
}
