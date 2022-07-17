import 'package:beat/Features/User/services/UserServices.dart';

class UserServicesTest{
  UserServices userServices = UserServices();

  void testCreateUser(){
    String email= "email", name = "name", password = "psswd";
    userServices.createUser(email, name, password);
  }
}