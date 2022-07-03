import 'package:beat/Features/Network/repository/NetworkRepository.dart';

class NetworkService{
  NetworkRepository networkRepository = NetworkRepository();

  void createRecord(){
    networkRepository.newNetworkRecord();
  }

  void updateProgress(String id, double percentage){
    networkRepository.updateNetworkPercentage(id, percentage);
  }

  void resetGoal(String id, double goal){
    networkRepository.updateNetworkGoal(id, goal);
  }
}