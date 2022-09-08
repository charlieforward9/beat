import 'dart:developer';
import 'package:amplify_datastore/amplify_datastore.dart';

import '../../User/repository/UserRepository.dart';
import '../../../models/ModelProvider.dart';
import '../../../global.dart' as global;

class UserService {
  UserRepository userRepository = UserRepository();
  late User currentUser;

  _logUser(user) {
    log("This log is being made from the UserService file. It returns the current user that is specified by email in the main.dart initialization function. \n\nThis user entity is accessable by global.currentUser \n ${user.toString()}",
        name: "Notice");
  }

  //User instance saved to <global.currentUser> import file for simple reference
  UserService(String email) {
    getUser(email).then((user) => {global.currentUser = user, _logUser(user)});
  }

  void createUser(
      String _email,
      String _userName,
      String _userPassword,
      String _userFirstName,
      String _userLastName,
      GenderTypes _userGender,
      TemporalDate _userBirthDate,
      String _userAvatar) {
    final User user = User(
        userEmail: _email,
        userName: _userName,
        userPassword: _userPassword,
        userFirstName: _userFirstName,
        userLastName: _userLastName,
        userGender: _userGender,
        userBirthDate: _userBirthDate,
        userAvatar: _userAvatar);
    userRepository.saveUser(user);
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
