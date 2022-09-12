import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/models/ModelProvider.dart';

class IntegrationRepository {

Future<void> saveIntegration(Integrations _integrations) async {
  await Amplify.DataStore.save(_integrations);
}

  Future<Integrations> fetchIntegration(String _id) async {
    return await Amplify.DataStore.query(Integrations.classType,
            where: Integrations.ID.eq(_id))
        .then((integration) => integration.first);
  }
}
