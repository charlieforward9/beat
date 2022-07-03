import 'package:beat/Features/Recovery/repository/RecoveryRepository.dart';

class RecoveryService{
  RecoveryRepository recoveryRepository = RecoveryRepository();

  void createRecord(){
    recoveryRepository.newRecoveryRecord();
  }

  void updateProgress(String id, double percentage){
    recoveryRepository.updateRecoveryPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    recoveryRepository.updateRecoveryGoal(id, goal);
  }
}
