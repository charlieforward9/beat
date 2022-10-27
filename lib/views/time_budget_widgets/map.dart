import 'package:beat/data/Geolocation/GeolocationRepository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatelessWidget {
  final double lat;
  final double lng;
  Map({Key? key, required this.lat, required this.lng}) : super(key: key);

  late GoogleMapController mapController;
  late GeolocationRepository geolocationRepository;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onCameraIdle() {
    mapController.getZoomLevel().then((value) => print(value));
    //mapController.getLatLng(screenCoordinate)
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      onCameraIdle: onCameraIdle,
      initialCameraPosition: CameraPosition(
        target: LatLng(lat, lng),
        zoom: 10,
      ),
    );
  }
}