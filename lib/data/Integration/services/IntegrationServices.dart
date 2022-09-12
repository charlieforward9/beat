import 'dart:developer';

import 'package:beat/config/global.dart';
import 'package:beat/data/Integration/repository/IntegrationRepository.dart';
import 'package:beat/models/ModelProvider.dart';

class IntegrationService {
  final IntegrationRepository _integrationRepository = IntegrationRepository();

  void logCurrentUserIntegrations() {
    log("access by importing <lib/config/global> and calling currentUserIntegrations: \n $currentUserIntegrations ",
        name: "Current User Integration");
  }

  Future<void> createIntegration(Integrations _integration) async {
    await _integrationRepository.saveIntegration(_integration);
  }

  Future<void> initIntegration(String _id) async {
    await getIntegration(_id).then((_integration) =>
        {currentUserIntegrations = _integration, logCurrentUserIntegrations()});
  }

  Future<Integrations> getIntegration(String id) async {
    return await _integrationRepository.fetchIntegration(id);
  }
}
