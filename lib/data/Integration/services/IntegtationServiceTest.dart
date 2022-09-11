import 'dart:developer';

import 'package:beat/config/global.dart';

import 'IntegrationServices.dart';

class IntegrationServiceTest {
  IntegrationService integrationService = IntegrationService();

  // logIntegrations(integrations) {
  //   log("access by importing <lib/config/global> and calling currentUser: \n $integrations",
  //       name: "Current UserIntegration");
  // }

  void logCurrentUserIntegrations() {
    log("access by importing <lib/config/global> and calling currentUserIntegrations: \n $currentUserIntegrations ",
        name: "Current User Integration");
  }
}
