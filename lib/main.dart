import 'dart:developer';

import 'package:beat/Features/Recovery/repository/RecoveryRepository.dart';
import 'package:beat/Features/Recovery/services/RecoveryService.dart';
import 'package:beat/models/ModelProvider.dart';
// import 'package:beat/Recovery/models/sleep_widget_model.dart';
import 'package:flutter/material.dart';
// import 'Common_Widgets/sleep_widget.dart';
// import '/Features/Recovery/repository/API/API.dart';
// import 'package:safeprint/safeprint.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';


import 'amplifyconfiguration.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
 
  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    String percentage = "0";
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                RecoveryService recoveryService = RecoveryService();
                recoveryService.createRecovery(10.0);
                //FutureBuilder<SleepWidgetModel> test = buildBucket(context); 
                //Navigator.of(context).push(
                //    MaterialPageRoute(builder: (context) => buildBucket(context)));
              },
              child: Text('create new recovery goal [goal: 10 hours]')),
            ElevatedButton(
              onPressed: () async {
                RecoveryService recoveryService = RecoveryService();
                RecoveryRepository recoveryRepository = RecoveryRepository();
                var originalRecovery = await recoveryRepository.getRecoveryById("ffa68777-2e68-4595-995e-f384ed250937");
                recoveryService.updateRecoveryPercentage(originalRecovery!,5.0);
                //FutureBuilder<SleepWidgetModel> test = buildBucket(context); 
                //Navigator.of(context).push(
                //    MaterialPageRoute(builder: (context) => buildBucket(context)));
              },
              child: Text('update recovery percentage')),
          ],
        ),
      ),
    );
  }
}


Future<void> _configureAmplify() async {
  final api = AmplifyAPI(modelProvider: ModelProvider.instance);
  await Amplify.addPlugin(api);

  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    log('Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
  }
}

