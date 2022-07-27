//IMPORT STATEMENT SHOULD LOOK LIKE THIS
//import '<PATH>' as controller;


//TODO: Fit controller with real data
Future<List<double>> pullDurationData() {
  List<double> data = List.filled(growable: false, 5, 0);

  //DUMMY DATA
  data[0] = 0.75;
  data[1] = 1.00;
  data[2] = 0.53;
  data[3] = 0.92;
  data[4] = 0.65;

  return Future.delayed(
      const Duration(seconds: 1), () => Future<List<double>>.value(data));
}
