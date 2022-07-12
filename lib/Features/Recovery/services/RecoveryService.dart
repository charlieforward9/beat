import 'package:beat/Features/Recovery/models/Recovery.dart';
import 'package:beat/Features/Recovery/repository/RecoveryRepository.dart';

class RecoveryService {
  RecoveryRepository recoveryRepository = RecoveryRepository();

  Future<void> createRecord() async {
    recoveryRepository.newRecoveryRecord();
  }

  Future<Recovery> getRecordById(String id) async {
    return recoveryRepository.getRecordById(id);
  }

  Future<void> updateProgress(String id, double percentage) async {
    return recoveryRepository.updateRecoveryPercentage(id, percentage);
  }

  Future<void> resetGoal(String id, double goal) async {
    return recoveryRepository.updateRecoveryGoal(id, goal);
  }
}
