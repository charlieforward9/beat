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

  void updateProgress(String id, double percentage){
    fitnessRepository.updateFitnessPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    fitnessRepository.updateFitnessGoal(id, goal);
  }
}