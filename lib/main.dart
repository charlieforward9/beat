//DONT DELETE
//export PATH=/Users/crich/Documents/flutter/bin:$PATH

//***********Backend-related Imports***********//
import 'dart:async';
import 'dart:developer';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:beat/config/locale_config.dart';
import 'package:beat/cubits/goal_cubit.dart';
import 'package:beat/cubits/activity_cubit.dart';
import 'package:beat/data/User/services/UserService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'models/ModelProvider.dart';

//***********Frontend-related Imports***********//
import 'views/home_view.dart';
import 'views/weekly_progress_view.dart';
import 'views/time_budget_view.dart';
import 'package:beat/views/settings_view.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  String userEmail = "charlesrichardsonusa@gmail.com";
  bool amplifyConfigured = false;
  StreamSubscription<HubEvent>? stream;

  @override
  void initState() {
    super.initState();
    kDebugMode ? _configureAmplifyDev() : _configureAmplifyProd();
  }

  //Pages in the navBar, in order of display from left to right
  // removed const from this function
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WeeklyLog(),
    TimeBudgetPage(),
    SettingsPage(),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (amplifyConfigured) {
      return MaterialApp(
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          title: 'Flutter Demo',
          home: MultiBlocProvider(
              providers: [
                BlocProvider<GoalCubit>(
                  create: (context) => GoalCubit()
                    ..getDayGoals()
                    ..observeGoals(),
                ),
                BlocProvider<ActivityCubit>(
                    create: ((context) => ActivityCubit()..presentChanges())),
              ],
              child: Scaffold(
                body: Center(
                  child: _widgetOptions.elementAt(_selectedPage),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month_outlined),
                      label: 'Log',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.edit),
                      label: 'Edit',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: 'Settings')
                  ],
                  currentIndex: _selectedPage,
                  selectedItemColor: Colors.amber[800],
                  unselectedItemColor: Colors.amber[500],
                  onTap: _onNavBarTapped,
                ),
              )));
    }
    return const MaterialApp(
        title: "Not Config",
        home: Scaffold(
          body: Center(child: Text("Amplify Not Config")),
        ));
  }

  void _configureAmplifyProd() async {
    log("Production (local storage persistant on app restart)",
        name: "Amplify Config Mode");
    final datastorePlugin = AmplifyDataStore(
      modelProvider: ModelProvider.instance,
    );
    // Add the following line and update your function call with `addPlugins`
    final api = AmplifyAPI();
    await Amplify.addPlugins([datastorePlugin, api]);
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);

    syncListener();
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      debugPrint(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android. To solve: Reset App.');
    }
  }

  void _configureAmplifyDev() async {
    log("Development (local storage cleared and resynced upon app restarted)",
        name: "Amplify Config Mode");
    final datastorePlugin = AmplifyDataStore(
      modelProvider: ModelProvider.instance,
    );
    final api = AmplifyAPI();
    await Amplify.addPlugins([datastorePlugin, api]);
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);

    syncListener();
    try {
      await Amplify.configure(amplifyconfig).whenComplete(
        () => Amplify.DataStore.clear().whenComplete(
          () => Amplify.DataStore.start(),
        ),
      );
    } on AmplifyAlreadyConfiguredException {
      debugPrint(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android. To solve: Reset App.');
    }
  }

  //Delays queries until DataStore is completely synced
  void syncListener() {
    Amplify.Hub.listen(([HubChannel.DataStore]), (hubEvent) {
      if (hubEvent.eventName == 'ready') {
        UserService().initUser(userEmail);
        setState(
          () {
            amplifyConfigured = true;
          },
        );
      }
    });
  }
}
