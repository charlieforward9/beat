//export PATH=/Users/crich/Documents/flutter/bin:$PATH
import 'dart:developer';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:beat/Features/Recovery/repository/RecoveryRepository.dart';
import 'package:beat/Features/Recovery/services/RecoveryService.dart';
import 'package:beat/models/ModelProvider.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'amplifyconfiguration.dart';

import 'package:beat/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //TODO: Color needs revision (Not urgent)
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// Future<void> _configureAmplify() async {
//   final api = AmplifyAPI(modelProvider: ModelProvider.instance);
//   await Amplify.addPlugin(api);


//   try {
//     await Amplify.configure(amplifyconfig);
//   } on AmplifyAlreadyConfiguredException {
//     log('Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
//   }
// }

void _configureAmplify() async {
  final datastorePlugin = AmplifyDataStore(
    modelProvider: ModelProvider.instance,
  );
  // Add the following line and update your function call with `addPlugins`
  final api = AmplifyAPI();
  await Amplify.addPlugins([datastorePlugin, api]);
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
  }
}
