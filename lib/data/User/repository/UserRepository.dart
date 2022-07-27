import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class UserRepository {
  Future<void> newUser(String email, String name, String password) async {
    final newRecord =
        User(userEmail: email, userName: name, userPassword: password);
    await Amplify.DataStore.save(newRecord);
  }

  Future<User> fetchUserByEmail(String email) async {
    return await Amplify.DataStore.query(User.classType,
            where: User.USEREMAIL.eq(email))
        .then((user) => user.first);
    }

  Future<User> fetchCurrentUser(String id) async {
    return Amplify.DataStore.query(User.classType, where: User.ID.eq(id))
        .then((user) => user.first);
  }
}
