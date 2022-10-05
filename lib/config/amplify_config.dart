import 'dart:developer';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/config/amplifyconfiguration.dart';
import 'package:beat/models/ModelProvider.dart';

class AmplifyConfiguration {
  final String userEmail = "charlesrichardsonusa@gmail.com";
  final signUpForm = SignUpForm.custom(
    fields: [
      SignUpFormField.username(),
      SignUpFormField.password(),
      SignUpFormField.passwordConfirmation(),
      SignUpFormField.birthdate(required: true),
      SignUpFormField.givenName(required: true),
      SignUpFormField.familyName(required: true),
      SignUpFormField.gender(required: true),
      SignUpFormField.nickname(required: true),
    ],
  );

  Future<void> init() async {
    final datastorePlugin = AmplifyDataStore(
      modelProvider: ModelProvider.instance,
    );
    // Add the following line and update your function call with `addPlugins`
    final api = AmplifyAPI();
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugins([datastorePlugin, api, auth]);
  }

  void configProd() async {
    log("Production (local storage persistant on app restart)",
        name: "Amplify Config Mode");
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      log('Tried to reconfigure Amplify; this can occur when your app restarts on Android. To solve: Reset App.');
    }
  }

  void configDev() async {
    log("Development (local storage cleared and resynced upon app restarted)",
        name: "Amplify Config Mode");
    try {
      await Amplify.configure(amplifyconfig).whenComplete(
        () => Amplify.DataStore.clear().whenComplete(
          () => Amplify.DataStore.start(),
        ),
      );
    } on AmplifyAlreadyConfiguredException {
      log('Tried to reconfigure Amplify; this can occur when your app restarts on Android. To solve: Reset App.');
    }
  }
}
