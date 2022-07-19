import 'package:beat/Features/User/services/UserService.dart';

class UserServicesTest{
  UserService userServices = UserService();

  void testCreateUser(){
    String email= "email", name = "name", password = "psswd";
    userServices.createUser(email, name, password);
  }
}