import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class UserRepository{

  Future<void> newUser(String email, String name, String password) async {
    final newRecord = User(userEmail: email, userName: name, userPassword: password);
    await  Amplify.DataStore.save(newRecord);
  }

  Future<User> getUserByEmail(String email) async {
    final record = await Amplify.DataStore.query(
      User.classType,
      where: User.USEREMAIL.eq(email)
    );
    return record.first;
  }
}
