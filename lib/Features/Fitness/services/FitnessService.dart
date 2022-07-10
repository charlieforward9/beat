import 'package:beat/Features/Fitness/repository/FitnessRepository.dart';

import '../../../models/Fitness.dart';

class FitnessService{
  FitnessRepository fitnessRepository = FitnessRepository();

  void createRecord(){
    fitnessRepository.newFitnessRecord();
  }

  Future<Fitness> getRecordById(String id){
    return fitnessRepository.getRecordById(id);
  }

  Future<void> updateProgress(String id, double percentage) async {
    return fitnessRepository.updateFitnessPercentage(id, percentage);
  }

  Future<void> resetGoal(String id, double goal) async {
    return fitnessRepository.updateFitnessGoal(id, goal);
  }
}