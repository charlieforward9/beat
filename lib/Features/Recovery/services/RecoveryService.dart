import 'dart:ffi';

import 'package:beat/Features/Recovery/models/Recovery.dart';
import 'package:beat/Features/Recovery/repository/RecoveryRepository.dart';

class RecoveryService {
  RecoveryRepository recoveryRepository = RecoveryRepository();

  void createRecord() {
    recoveryRepository.newRecoveryRecord();
  }

  Future<String> getRecordById(String id) async {
    //double sum = 0.0;
    Recovery record = new Recovery();
    recoveryRepository.getRecordById(id).then((value) => {record = value});

    record = await recoveryRepository.getRecordById(id);

    String percentage = record.percentage as String;

    return percentage;
  }

  void updateProgress(String id, double percentage) {
    recoveryRepository.updateRecoveryPercentage(id, percentage);
  }

  void resetGoal(String id, double goal) {
    recoveryRepository.updateRecoveryGoal(id, goal);
  }
}
