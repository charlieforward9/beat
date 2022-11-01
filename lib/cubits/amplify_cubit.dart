import 'dart:developer';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/config/amplifyconfiguration.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

abstract class AmplifyState {}

class AmplifyConfigured extends AmplifyState {}

class AmplifyNotConfigured extends AmplifyState {}

class AmplifyFailure extends AmplifyState {
  final Exception exception;
  AmplifyFailure({required this.exception});
}

class AmplifyCubit extends Cubit<AmplifyState> {
  final signUpForm = SignUpForm.custom(
    fields: [
      SignUpFormField.username(),
      SignUpFormField.password(),
      SignUpFormField.passwordConfirmation(),
      SignUpFormField.birthdate(required: true),
      SignUpFormField.givenName(required: true),
      SignUpFormField.familyName(required: true),
      //SignUpFormField.custom(title: 'Gender', attributeKey: )
      SignUpFormField.custom(
          attributeKey: CognitoUserAttributeKey.gender,
          title: "Gender",
          required: true,
          hintText: "M , F , X",
          validator: (value) {
            if (value != null &&
                value.contains(RegExp('[MFX]')) &&
                value.length == 1) {
              return null;
            } else {
              return 'M , F or X (case sensitive)';
            }
          }),
    ],
  );

  AmplifyCubit() : super(AmplifyNotConfigured());

  Future<void> init() async {
    try {
      final datastorePlugin = AmplifyDataStore(
        modelProvider: ModelProvider.instance,
        authModeStrategy: AuthModeStrategy.multiAuth,
      );
      // Add the following line and update your function call with `addPlugins`
      final api = AmplifyAPI();
      final auth = AmplifyAuthCognito();
      await Amplify.addPlugins([datastorePlugin, api, auth]);
      try {
        await Amplify.configure(amplifyconfig).then((value) {
          kDebugMode ? _verboseLogging() : null;
          Amplify.Auth.fetchAuthSession().then(((session) {
            if (session.isSignedIn && kDebugMode) {
              configDev();
              syncListener();
            } else {
              configProd();
              emit(AmplifyConfigured());
            }
          }));
        });
      } on AmplifyAlreadyConfiguredException {
        emit(AmplifyFailure(
            exception: Exception(
                'Tried to reconfigure Amplify; this can occur when your app restarts on Android. To solve: Reset App.')));
      }
    } on Exception catch (e) {
      emit(AmplifyFailure(exception: e));
    }
  }

  Future<void> configProd() async {
    log("Production (local storage persistant on app restart) or no user signed in",
        name: "Amplify Config Mode");
  }

  Future<void> configDev() async {
    log("Development (local storage cleared and resynced upon app restarted)",
        name: "Amplify Config Mode");
    await Amplify.DataStore.clear().then((_) => Amplify.DataStore.start());
  }

  //Delays queries until DataStore is completely synced
  void syncListener() {
    Amplify.Hub.listen(([HubChannel.DataStore]), (hubEvent) {
      log("${hubEvent.eventName} ${hubEvent.payload}");
      if (hubEvent.eventName == 'ready') {
        emit(AmplifyConfigured());
      }
    });
  }

  void _verboseLogging() {
    Amplify.Hub.listen(([HubChannel.DataStore, HubChannel.Auth]), (hubEvent) {
      log("${hubEvent.eventName} ${hubEvent.payload}", name: "Amplify");
    });
  }
}
