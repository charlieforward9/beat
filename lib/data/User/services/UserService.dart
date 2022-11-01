import 'dart:developer';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/data/DefaultTarget/service/target_service.dart';
import 'package:beat/data/Integration/services/IntegrationServices.dart';

import '../../User/repository/UserRepository.dart';
import '../../../models/ModelProvider.dart';
import '../../../config/global.dart' as global;

class UserService {
  UserRepository userRepository = UserRepository();

  void _logUser(user) {
    log("access by importing <lib/config/global> and calling currentUser: \n $user",
        name: "Current User");
  }

  //User instance saved to <global.currentUser> import file for simple reference
  Future<User> initUser() async {
    final userData = await Amplify.Auth.fetchUserAttributes();
    log("userData has returned with the values $userData");
    late String email, givenname, familyname, birthdate, gender;

    for (var element in userData) {
      switch (element.userAttributeKey.key) {
        case "email":
          email = element.value;
          break;
        case "given_name":
          givenname = element.value;
          break;
        case "family_name":
          familyname = element.value;
          break;
        case "birthdate":
          birthdate = element.value;
          break;
        case "gender":
          gender = element.value;
          break;
      }
    }
    return getUser(email).then((user) async {
      if (user != null) {
        log("User found");
        return user;
      } else {
        log("Registering the User");
        Amplify.DataStore.start();
        return await DefaultTargetService().createDefaultTargets(null).then(
            (targets) async => await createUser(
                email, givenname, familyname, gender, birthdate, targets));
      }
    });

    //If the code reaches here, the user is created (registered) to storage
  }

  Future<User> createUser(
    String email,
    String userFirstName,
    String userLastName,
    String userGender,
    String userBirthDate,
    DefaultTargets userTargets,
    // TODO create an input for a profile picture
    {
    String userAvatar =
        "https://dgalywyr863hv.cloudfront.net/pictures/athletes/45046621/12580522/19/large.jpg",
  }) async {
    final User user = User(
        email: email,
        firstName: userFirstName,
        lastName: userLastName,
        gender: fromString(userGender)!,
        birthDate: TemporalDate.fromString(userBirthDate),
        avatar: userAvatar,
        userTargetsId: userTargets.id,
        targets: userTargets);
    await userRepository.saveUser(user);
    return user;
  }

  Future<User?> getUser(String email) {
    return userRepository.fetchUserByEmail(email);
  }

  Future<List<Goal>?> getUserGoals(String email) async {
    User? user = await getUser(email);
    return user?.goals;
  }

  Future<void> updateUser(User _user) async {
    await userRepository.saveUser(_user);
  }

  void populateGlobal(User user) async {
    global.currentUser = user;
    _logUser(global.currentUser);
    if (global.currentUser.userIntegrationId != null) {
      await IntegrationService()
          .initIntegration(global.currentUser.userIntegrationId!);
    } else {
      log("Integrations not set up, go to settings page and link Strava account to sync workouts to activities");
    }
    DefaultTargetService().initDefaultTargets(global.currentUser.userTargetsId);
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
