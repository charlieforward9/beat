import 'package:beat/Features/Fuel/repository/FuelRepository.dart';
import '../../../models/Fuel.dart';

class FuelService{
  FuelRepository fuelRepository = FuelRepository();

  void createRecord(){
    fuelRepository.newFuelRecord();
  }

  Future<Fuel> getRecordById(String id){
    return fuelRepository.getRecordById(id);
  }

  void updateProgress(String id, double percentage){
    fuelRepository.updateFuelPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    fuelRepository.updateFuelGoal(id, goal);
  }
}