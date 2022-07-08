import 'package:beat/Features/Recovery/repository/RecoveryRepository.dart';

class RecoveryService{
  RecoveryRepository recoveryRepository = RecoveryRepository();

  void createRecord(){
    recoveryRepository.newRecoveryRecord();
  }

  void getRecordById(String id){
    recoveryRepository.getRecordById(id);
  }

  void updateProgress(String id, double percentage){
    recoveryRepository.updateRecoveryPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    recoveryRepository.updateRecoveryGoal(id, goal);
  }
}
