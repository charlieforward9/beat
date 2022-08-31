import 'package:geolocator/geolocator.dart';

class GeolocationService {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<void> isLocationEnabled() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
  }

  /* We dont want to rewrite these fucntions, we should check if
    we have the permissions and then call the API functions
    what should go in this service?
      * any copmutation that require the location
        ex: we want to find if the user is in the office
        use geolocation api and 
  */
  Future<Position> getCurrentLocation() async {
    //isLocationEnabled();
    /*
      desiredAccuracy: the accuracy of the location data that your app wants to receive;
      timeLimit: the maximum amount of time allowed to acquire the current location.
      When the time limit is passed a TimeOutException will be thrown and the call will
      be cancelled. By default no limit is configured.
    */
    return await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<Position?> getLastPosition() async {
    isLocationEnabled();
    /*
      To query the last known location retrieved stored on the device you can use the 
      getLastKnownPosition method (note that this can result in a null value when no 
      location details are available):
    */
    return await Geolocator.getLastKnownPosition();
  }
  //TODO: Current make and integrate geolocator bloc 
}



