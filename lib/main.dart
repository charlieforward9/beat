//export PATH=/Users/crich/Documents/flutter/bin:$PATH

//***********Backend-related Imports***********//
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:beat/Features/User/services/UserService.dart';
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
  late UserService userService;
  String userEmail = "charlesrichardsonusa@gmail.com";

  @override
  void initState() {
    super.initState();
    _configureAmplify();
    //Delay incuded to prevent error pertaining to configuring not being finished when UserService is called
    //User instance saved to <global.currentUser> import file for easy reference
    Future.delayed(
      Duration(seconds: 2),
      () => UserService(userEmail),
    );
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
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          //backgroundColor: Theme.of(context).primaryColor,
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
        ));
  }
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
}
