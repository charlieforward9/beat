//***********Backend-related Imports***********//
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:beat/cubits/goal_cubit.dart';
import 'package:beat/data/User/services/UserService.dart';
import 'package:beat/views/loading_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'amplifyconfiguration.dart';

import 'models/ModelProvider.dart';

//***********Frontend-related Imports***********//
import 'views/home_view.dart';
import 'views/weekly_progress_view.dart';
import 'views/time_budget_view.dart';

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

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  //Pages in the navBar, in order of display from left to right
  // removed const from this function
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WeeklyLog(),
    TimeBudgetPage(),
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
          title: 'Flutter Demo',
          home: BlocProvider(
              create: (context) => GoalCubit()
                ..getDayGoals()
                ..observeGoals(),
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
                  ],
                  currentIndex: _selectedPage,
                  selectedItemColor: Colors.amber[800],
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
      debugPrint(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android. To solve: Reset App.');
    }
    setState(() {
      UserService(userEmail);
      amplifyConfigured = true;
    });
  }
}
