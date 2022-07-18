import 'package:flutter/material.dart';

//*************** Services Import *************** */
import '../Features/Fitness/services/FitnessService.dart';
import '../Features/Recovery/services/RecoveryService.dart';
import '../Features/Fuel/services/FuelService.dart';
import '../Features/Network/services/NetworkService.dart';
import '../Features/Productivity/services/ProductivityService.dart';

class WeeklyLog extends StatefulWidget {
  WeeklyLog({Key? key}) : super(key: key);

  @override
  State<WeeklyLog> createState() => _WeeklyLogState();
}

class _WeeklyLogState extends State<WeeklyLog> {
  //*************** Services *************** */
  FitnessService fitnessService = FitnessService();
  RecoveryService recoveryService = RecoveryService();
  FuelService fuelService = FuelService();
  NetworkService networkService = NetworkService();
  ProductivityService productivityService = ProductivityService();
  //*************** ID FOR TESTING *************** */
  final fitnessID = "c6a235e6-a42f-49f7-b9d2-0656c91d0880";
  final recoveryID = "c460788a-7519-49f6-baa0-81624b4d0748";
  final fuelID = "b403bc49-60dd-4b82-aa9c-2c2c6ac99765";
  final networkID = "57863e60-1f20-4bf9-89a5-c05968475a29";
  final productivityID = "ffbdee44-436e-4560-8d30-562235986c85";
  //*********************************************** *//

  @override
  void initState() {
    super.initState();
  }

  //A super sus looking function that grabs all the percentages from the category services, delays the event loop, and then returns
  //TODO: This needs to be adjusted under the new data model
  Future<List<double>> _fetchDurationData() {
    List<double> data = List.filled(growable: false, 10, 0);

    recoveryService.getRecordById(recoveryID).then(
      (value) {
        data[0] = value.percentage! / value.goal!;
      },
    );

    fitnessService.getRecordById(fitnessID).then(
      (value) {
        data[1] = value.percentage! / value.goal!;
      },
    );
    networkService.getRecordById(networkID).then(
      (value) {
        data[2] = value.percentage! / value.goal!;
      },
    );
    fuelService.getRecordById(fuelID).then(
      (value) {
        data[3] = value.percentage! / value.goal!;
      },
    );
    productivityService.getRecordById(productivityID).then(
      (value) {
        data[4] = value.percentage! / value.goal!;
      },
    );
    return Future.delayed(
        const Duration(seconds: 1), () => Future<List<double>>.value(data));
  }

  Future<String> _testFuture() {
    return Future.delayed(Duration(seconds: 2), () => 'Data');
  }

  @override
  Widget build(BuildContext context) {
    double _weekLogMaxWidth = MediaQuery.of(context).size.width * 0.9;
    double _categoryMaxWidth = _weekLogMaxWidth / 5;

    return SingleChildScrollView(
        //Current: Making one instance of a week view within the Container widget
        child: Container(
      height: 50,
      width: _weekLogMaxWidth,
      color: Colors.black12,
      padding: EdgeInsets.zero,
      //TODO: Program for multiple weeks to be inserted somewhere around here
      child: FutureBuilder<List<double>>(
        future:
            _fetchDurationData(), // a previously-obtained Future<String> or null
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
                    ],
                  ),
                )
              ];
            } catch (e) {
              print(e);
              children = [Text('error')];
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
                child: Text('Awaiting result...'),
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