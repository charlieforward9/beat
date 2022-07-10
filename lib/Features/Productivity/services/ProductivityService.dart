import 'package:beat/Features/Productivity/models/Productivity.dart';
import 'package:beat/Features/Productivity/repository/ProductivityRepository.dart';

class ProductivityService {
  ProductivityRepository productivityRepository = ProductivityRepository();

  void createRecord() {
    productivityRepository.newProductivityRecord();
  }

  Future<Productivity> getRecordById(String id) async {
    return await productivityRepository.getRecordById(id);
  }

  Future<void> updateProgress(String id, double percentage) async {
    return productivityRepository.updateProductivityPercentage(id, percentage);
  }

  Future<void> resetGoal(String id, double goal) async {
    return productivityRepository.updateProductivityGoal(id, goal);
  }
}
