import 'package:beat/models/Network.dart';
import 'package:beat/Features/Network/repository/NetworkRepository.dart';

class NetworkService{
  NetworkRepository networkRepository = NetworkRepository();

  void createRecord(){
    networkRepository.newNetworkRecord();
  }

  Future<Network> getRecordById(String id){
    return networkRepository.getRecordById(id);
  }

  Future<void> updateProgress(String id, double percentage) async {
    return networkRepository.updateNetworkPercentage(id, percentage);
  }

  Future<void> resetGoal(String id, double goal) async {
    return networkRepository.updateNetworkGoal(id, goal);
  }
}