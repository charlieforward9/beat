import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class DefaultTargetRepository {
  Future<DefaultTargets> saveDefaultTargets(DefaultTargets _defaultTargets) async {
    await Amplify.DataStore.save(_defaultTargets);
    return _defaultTargets;
  }

  Future<DefaultTargets> fetchDefaultTargets(String _id) async {
    return await Amplify.DataStore.query(DefaultTargets.classType,
            where: DefaultTargets.ID.eq(_id))
        .then((target) => target.first);
  }

  Future<bool> isFirstTimeUser(String _id) async {
    return await Amplify.DataStore.query(DefaultTargets.classType,
            where: DefaultTargets.ID.eq(_id))
        .then((value) => value.first.firstTime);
  }
}
