import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key}) : super(key: key);

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

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
        ),
      ),
    );
  }
}


// import 'dart:developer';

// import 'package:beat/blocs/geolocation/geolocation_bloc.dart';
// import 'package:beat/data/Geolocation/GeolocationService.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapPage extends StatelessWidget {
//   MapPage({Key? key}) : super(key: key);

//   late GoogleMapController mapController;

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider<GeolocationService>(
//       create: (_) => GeolocationService(),
//       child: BlocProvider(
//         create: (context) => GeolocationBloc(
//             geolocationService: context.read<GeolocationService>())
//           ..add(LoadGeolocation()),
//         child: MaterialApp(
//           home: Scaffold(
//             appBar: AppBar(
//               title: const Text('Maps Sample'),
//               backgroundColor: Colors.green[700],
//             ),
//             body: BlocBuilder<GeolocationBloc, GeolocationState>(
//               builder: (context, state) {
//                 if (state is GeolocationLoading) {
//                   //TODO make this a custom widget with a message attribute
//                   return Center(child: CircularProgressIndicator());
//                 } else if (state is GeolocationLoaded) {
//                   return GoogleMap(
//                     onMapCreated: _onMapCreated,
//                     initialCameraPosition: CameraPosition(
//                       target: LatLng(
//                           state.position.latitude, state.position.longitude),
//                       zoom: 11.0,
//                     ),
//                   );
//                 } else {
//                   log("Error on map_view.dart");
//                   return Text("Something went wrong");
//                 }
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
