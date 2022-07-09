import 'package:beat/Features/Productivity/models/Productivity.dart';
import 'package:beat/Features/Productivity/repository/ProductivityRepository.dart';

class ProductivityService{
  ProductivityRepository productivityRepository = ProductivityRepository();

  void createRecord(){
    productivityRepository.newProductivityRecord();
  }

  Future<Productivity> getRecordById(String id) async {
    return await productivityRepository.getRecordById(id);
  }

  void updateProgress(String id, double percentage){
    productivityRepository.updateProductivityPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    productivityRepository.updateProductivityGoal(id, goal);
  }
}