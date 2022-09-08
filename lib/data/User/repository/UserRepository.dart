import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class UserRepository {
  Future<void> saveUser(User user) async {
    await Amplify.DataStore.save(user);
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

