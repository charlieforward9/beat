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

  void updateProgress(String id, double percentage){
    networkRepository.updateNetworkPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    networkRepository.updateNetworkGoal(id, goal);
  }
}