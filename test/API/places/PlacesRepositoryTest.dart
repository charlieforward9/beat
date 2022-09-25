import 'package:beat/API/places/repository/place_repository.dart';
import 'package:google_place/google_place.dart';
import 'package:test/test.dart';

void main() async {
  late PlaceRepository placeRepository;

  setUp(() {
    placeRepository = PlaceRepository();
  });

  test('Places API Test - restaurant: Subway', () async {
    Location coord = Location(lat: 29.651839642172597, lng: -82.33525864204904);
    int radius = 5;
    String type = "restaurant";
    NearBySearchResponse? response =
        await placeRepository.fetchPlaceUsingCoord(coord, radius, type);
    expect(response?.results![0].name, "Subway");
  });
}
