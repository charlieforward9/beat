import 'dart:developer';
import '../../User/repository/UserRepository.dart';
import '../../../models/ModelProvider.dart';
import '../../../global.dart' as global;

class UserService {
  UserRepository userRepository = UserRepository();
  late User currentUser;

  UserService(String email) {
    getUser(email)
        .then((user) => {
              global.currentUser = user,
              log("This log is being made from the UserService file. It returns the current user that is specified by email in the main.dart initialization function. \n\nThis user entity is accessable by global.currentUser",
                  name: "Notice"),
              log(global.currentUser.toString(),
                  name: "Current User Signed In on Init")
                  
            })
        .ignore();
    //TODO: DELAY HERE
  }

  void createUser(String email, String name, String password) {
    userRepository.newUser(email, name, password);
  }

  Future<User> getUser(String email) {
    return userRepository.fetchUserByEmail(email);
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

  Future<List<Goal>?> getUserGoals(String email) async {
    User user = await getUser(email);
    return user.userGoals;
  }
}
