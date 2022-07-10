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

  Future<void> updateProgress(String id, double percentage) async {
    return fuelRepository.updateFuelPercentage(id, percentage);
  }

  Future<void> resetGoal(String id, double goal) async {
    return fuelRepository.updateFuelGoal(id, goal);
  }
}