import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beat/cubits/goal_cubit.dart';
import 'package:beat/cubits/activity_cubit.dart';

import 'package:beat/views/home_view.dart';
import 'package:beat/views/weekly_progress_view.dart';
import 'package:beat/views/time_budget_view.dart';
import 'package:beat/views/settings_view.dart';

import 'package:flutter/material.dart';

class NavTabs extends StatefulWidget {
  const NavTabs({super.key});

  @override
  State<NavTabs> createState() => _NavTabsState();
}

class _NavTabsState extends State<NavTabs> {
  int _selectedPage = 0;

  //Pages in the navBar, in order of display from left to right
  // removed const from this function
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    WeeklyLog(),
    TimeBudgetPage(),
    const SettingsPage(),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<GoalCubit>(
            create: (context) => GoalCubit()..getDayGoals(),
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
        ));
  }
}
