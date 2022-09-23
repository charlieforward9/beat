import 'package:beat/auth/secrets.dart';
import 'package:google_place/google_place.dart';

class PlaceRepository {
  Future<NearBySearchResponse?> fetchPlaceUsingCoord(
      Location location, int radius, String _type) async {
    Secrects secrets = Secrects();
    var googlePlace = GooglePlace(secrets.PLACES_API_KEY);
    var response =
        await googlePlace.search.getNearBySearch(location, radius, type: _type);
    return response;
  }
}
