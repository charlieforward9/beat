//DONT DELETE
//export PATH=/Users/crich/Documents/flutter/bin:$PATH

//***********Backend-related Imports***********//
import 'package:beat/views/init_view.dart';
import 'package:flutter/foundation.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/config/locale_config.dart';
import 'package:beat/config/amplify_config.dart';
import 'package:beat/data/User/services/UserService.dart';

//***********Frontend-related Imports***********//
import 'package:flutter/material.dart';
import 'package:beat/views/nav_tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AmplifyConfiguration _amplifyConfig = AmplifyConfiguration();
  final String _userEmail = "charlesrichardsonusa@gmail.com";
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _amplifyConfig.init().whenComplete(
      () {
        if (kDebugMode) {
          syncListener();
          _amplifyConfig.configDev();
        } else {
          _amplifyConfig.configProd();
          userConfig();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_amplifyConfigured) {
      return Authenticator(
        signUpForm: _amplifyConfig.signUpForm,
        child: MaterialApp(
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          builder: Authenticator.builder(),
          title: 'BEAT',
          home: const InitPage(),
        ),
      );
    }
    return const MaterialApp(
        title: "Not Config",
        home: Scaffold(
          body: Center(child: Text("Amplify Not Configured")),
        ));
  }

  //Delays queries until DataStore is completely synced
  void syncListener() {
    Amplify.Hub.listen(([HubChannel.DataStore]), (hubEvent) {
      if (hubEvent.eventName == 'ready') {
        userConfig();
      }
    });
  }

  void userConfig() {
    UserService().initUser(_userEmail);
    setState(() => _amplifyConfigured = true);
    Amplify.Auth.fetchUserAttributes().then((value) => print(value));
  }
}
