import 'dart:developer';

import 'package:beat/data/User/services/UserService.dart';

class UserServiceTest extends UserService {
  void saveAndRetrieveUser() {
    log("Creating a new user");
    createUser("sample@sample.com", "FirstNameSample", "LastNameSample", "X",
            "2000-01-01")
        .then((usr) => getUser(usr.email))
        .then((user) => log("Saved and retrieved the user, $user"));
  }

  void logAllUserGoals() {
    getUserGoals("charlesrichardsonusa@gmail.com").then(
      (value) => log("This $value"),
    );
  }
}
