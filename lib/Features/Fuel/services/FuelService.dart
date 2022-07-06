import 'package:beat/Features/Fuel/repository/FuelRepository.dart';

class FuelService{
  FuelRepository fuelRepository = FuelRepository();

  void createRecord(){
    fuelRepository.newFuelRecord();
  }

  void updateProgress(String id, double percentage){
    fuelRepository.updateFuelPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    fuelRepository.updateFuelGoal(id, goal);
  }
}