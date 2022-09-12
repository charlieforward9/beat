import 'dart:developer';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:beat/data/Integration/services/IntegrationServices.dart';

import '../../User/repository/UserRepository.dart';
import '../../../models/ModelProvider.dart';
import '../../../config/global.dart' as global;

class UserService {
  UserRepository userRepository = UserRepository();
  late User currentUser;

  void _logUser(user) {
    log("access by importing <lib/config/global> and calling currentUser: \n $user",
        name: "Current User");
  }

  //User instance saved to <global.currentUser> import file for simple reference
  Future<void> initUser(email) async {
    await getUser(email).then((user) => {
          global.currentUser = user,
          _logUser(user),
        });

    //TODO OPTIMIZATION put this into a global file
    if (global.currentUser.userUserIntegrationsId != null) {
      await IntegrationService()
          .initIntegration(global.currentUser.userUserIntegrationsId!);
    } else {
      log("Integrations not set up, go to settings page and link Strava account to sync workouts to activities");
    }
  }

  Future<void> createUser(
      String _email,
      String _userName,
      String _userPassword,
      String _userFirstName,
      String _userLastName,
      GenderTypes _userGender,
      TemporalDate _userBirthDate,
      String _userAvatar) async {
    final User user = User(
        userEmail: _email,
        userName: _userName,
        userPassword: _userPassword,
        userFirstName: _userFirstName,
        userLastName: _userLastName,
        userGender: _userGender,
        userBirthDate: _userBirthDate,
        userAvatar: _userAvatar);
    await userRepository.saveUser(user);
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

  Future<void> updateUser(User _user) async {
    await userRepository.saveUser(_user);
  }

  //Testing out some new bidirectional swag, still working on it
  // Future<void> saveGoalToUser(Goal goal) async {
  //   if (currentUser.userGoals == null) {
  //     currentUser = currentUser.copyWith(userGoals: [goal]);
  //   } else {
  //     currentUser.userGoals!.add(goal);
  //   }
  //   return userRepository.saveUser(currentUser);
  // }
}
