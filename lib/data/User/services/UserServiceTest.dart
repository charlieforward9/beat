import 'package:beat/data/User/services/UserService.dart';

class UserServiceTest {
  UserService userService = UserService();

  // void testCreateUser(){
  //   String email= "email", name = "name", password = "psswd";
  //   userService.createUser(_email, _userName, _userPassword, _userFirstName, _userLastName, _userGender, _userBirthDate, _userAvatar);
  // }

  void logAllUserGoals() {
    userService
        .getUserGoals("charlesrichardsonusa@gmail.com")
        .then(
          (value) => print("This $value"),
        );
  }
}
