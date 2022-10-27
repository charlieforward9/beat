import 'package:beat/bloc/Geolocation/geolocation_bloc.dart';
import 'package:beat/data/Geolocation/GeolocationRepository.dart';
import 'package:beat/views/time_budget_widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class GeoFencePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 2. configure the paint and drawing properties
    final strokeWidth = size.width / 150.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 4;

    // 3. create and configure the background paint
    final backgroundPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.red
      ..style = PaintingStyle.stroke;
    // 4. draw a circle
    canvas.drawCircle(center, radius, backgroundPaint);
  }

  // 7. only return true if the old progress value
  // is different from the new one
  @override
  bool shouldRepaint(covariant GeoFencePainter oldDelegate) => false;
}

///
///
///TO IMPLEMENT THE WIDGET BELOW
///
///
//ElevatedButton(
// child: Text("Pull up the map with current location bubble"),
// onPressed: () => GeolocationRepository().isLocationEnabled().then(
//       (value) => Navigator.push<void>(
//         context,
//         MaterialPageRoute<void>(
//           builder: (BuildContext context) => const GeoEdit(),
//         ),
//       ),
//     )),
///
///
///


class GeoEdit extends StatelessWidget {
  const GeoEdit({super.key});
  Widget geoWidget(BuildContext context, Position position) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Map(lat: position.latitude, lng: position.longitude),
        ),
        Map(lat: position.latitude, lng: position.longitude),
        IgnorePointer(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: CustomPaint(painter: GeoFencePainter()),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit the Geofence")),
      body: RepositoryProvider<GeolocationRepository>(
        create: (_) => GeolocationRepository(),
        child: BlocProvider<GeolocationBloc>(
          create: (context) {
            return GeolocationBloc(
                geolocationRepository: context.read<GeolocationRepository>())
              ..add(LoadGeolocation());
            //..presentLocation();
          },
          child: BlocBuilder<GeolocationBloc, GeolocationState>(
            builder: ((context, state) {
              if (state is GeolocationLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is GeolocationLoaded) {
                return geoWidget(context, state.position);
                //ElevatedButton(onPressed: null, child: Text('Save Geo'))
                //],
                //);
              } else {
                return Center(
                  child: Text("Error"),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
