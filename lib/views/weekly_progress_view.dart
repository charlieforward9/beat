import 'package:flutter/material.dart';
import '../controllers/weekly_progress_controller.dart' as controller;
import '../data/Activity/services/ActivityServiceTest.dart';
import '../data/Goal/services/GoalServiceTest.dart';

class WeeklyLog extends StatefulWidget {
  WeeklyLog({Key? key}) : super(key: key);

  @override
  State<WeeklyLog> createState() => _WeeklyLogState();
}

class _WeeklyLogState extends State<WeeklyLog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _weekLogMaxWidth = MediaQuery.of(context).size.width * 0.9;
    double _categoryMaxWidth = _weekLogMaxWidth / 5;

    return SingleChildScrollView(
        //TODO: Add multiple instances of this.
        child: Container(
      height: 50,
      width: _weekLogMaxWidth,
      color: Colors.black12,
      padding: EdgeInsets.zero,
      //TODO: Program for multiple weeks to be inserted somewhere around here
      child: FutureBuilder<List<double>>(
        future: controller.pullDurationData(),
        builder: (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
          List<Widget> children;

          if (snapshot.connectionState == ConnectionState.done) {
            try {
              children = <Widget>[
                Container(
                  height: 50,
                  width: _weekLogMaxWidth,
                  color: Colors.black12,
                  padding: EdgeInsets.zero,
                  child: Row(
                    //TODO each container will require a unique category identifier name, color, percentage, etc
                    children: [
                      Container(
                        color: Colors.yellow,
                        height: 50,
                        width: _categoryMaxWidth * (snapshot.data![0]),
                        child: Text('${snapshot.data![0]}'),
                      ),
                      Container(
                        color: Colors.red,
                        height: 50,
                        width: _categoryMaxWidth * (snapshot.data![1]),
                        child: Text('${snapshot.data![1]}'),
                      ),
                      Container(
                        color: Colors.orange,
                        height: 50,
                        width: _categoryMaxWidth * (snapshot.data![2]),
                        child: Text('${snapshot.data![2]}'),
                      ),
                      Container(
                        color: Colors.blue,
                        height: 50,
                        width: _categoryMaxWidth * (snapshot.data![3]),
                        child: Text('${snapshot.data![3]}'),
                      ),
                      Container(
                        color: Colors.green,
                        height: 50,
                        width: _categoryMaxWidth * (snapshot.data![4]),
                        child: Text('${snapshot.data![4]}'),
                      ),
                      //HELPER FOR SIMPLE TESTING
                      // FloatingActionButton(
                      //     onPressed: () => ActivityServiceTest().createAndConfirmActivity(Activity());)
                      // ActivityServiceTest().createAnActivityForEachGoal()
                    ],
                  ),
                )
              ];
            } catch (e) {
              children = [Text(e.toString())];
            }
          } else if (snapshot.hasError) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result... (dummy data)'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    ));
  }
}
