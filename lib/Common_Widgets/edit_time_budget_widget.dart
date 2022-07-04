import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditTimeBudget extends StatefulWidget {
  EditTimeBudget({Key? key}) : super(key: key);

  @override
  State<EditTimeBudget> createState() => _EditTimeBudgetState();
}

class _EditTimeBudgetState extends State<EditTimeBudget> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(29.643633, -82.354927);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Maps Sample App'),
              backgroundColor: Colors.green[700],
            ),
            body: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            )));
  }
}
