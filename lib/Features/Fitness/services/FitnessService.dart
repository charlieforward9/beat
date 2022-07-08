import 'package:beat/Features/Fitness/repository/FitnessRepository.dart';

class FitnessService{
  FitnessRepository fitnessRepository = FitnessRepository();

  void createRecord(){
    fitnessRepository.newFitnessRecord();
  }

  void getRecordById(String id){
    fitnessRepository.getRecordById(id);
  }

  void updateProgress(String id, double percentage){
    fitnessRepository.updateFitnessPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    fitnessRepository.updateFitnessGoal(id, goal);
  }
}