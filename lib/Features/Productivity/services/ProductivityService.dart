import 'package:beat/Features/Productivity/repository/ProductivityRepository.dart';

class ProductivityService{
  ProductivityRepository productivityRepository = ProductivityRepository();

  void createRecord(){
    productivityRepository.newProductivityRecord();
  }

  void updateProgress(String id, double percentage){
    productivityRepository.updateProductivityPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    productivityRepository.updateProductivityGoal(id, goal);
  }
}