import 'package:beat/Features/User/repository/UserRepository.dart';
import '../../../models/ModelProvider.dart';

class UserService{
  UserRepository userRepository = UserRepository();

  void createUser(String email, String name, String password){
    userRepository.newUser(email, name, password);
  }

  Future<User> getUser(String email){
    return userRepository.getUserByEmail(email);
  }

  Future<String> getUserName(String email) async {
    User user = await getUser(email);
    return user.userName;
  }

  Future<String> getUserEmail(String email) async {
    User user = await getUser(email);
    return user.userEmail;
  }

  Future<String> getUserId(String email) async {
    User user = await getUser(email);
    return user.id;
  }
}