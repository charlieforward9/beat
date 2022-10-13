//DONT DELETE
//export PATH=/Users/crich/Documents/flutter/bin:$PATH

//***********Backend-related Imports***********//
import 'dart:developer';
import 'package:beat/cubits/auth_cubit.dart';
import 'package:beat/config/locale_config.dart';
import 'package:beat/config/amplify_config.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
//***********Frontend-related Imports***********//
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beat/views/init_view.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AmplifyConfiguration _amplifyConfig = AmplifyConfiguration();
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
          _amplifyConfig
              .configProd()
              .then((_) => setState(() => _amplifyConfigured = true));
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
          home: BlocProvider(
            create: (context) => AuthCubit()..authUser(),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return const InitPage();
                } else if (state is AuthFail) {
                  return Text("Auth Failed with state ${state.exception}");
                } else {
                  //state is Unauth()
                  return Center(
                    child: Column(children: const [
                      Text("Unauthorized"),
                      CircularProgressIndicator()
                    ]),
                  );
                }
              },
            ),
          ),
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
        log("Datastore ready to query");
        setState(() {
          _amplifyConfigured = true;
        });
      }
    });
  }
}
