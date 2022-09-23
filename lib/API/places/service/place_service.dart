import 'dart:async';

import 'package:beat/API/location/repository/location_repository.dart';
import 'package:beat/API/places/repository/place_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';

class PlaceService {
  var myPlaces = [
    "accounting",
    "airport",
    "amusement_park",
    "aquarium",
    "art_gallery",
    "atm",
    "bakery",
    "bank",
    "bar",
    "beauty_salon",
    "bicycle_store",
    "book_store",
    "bowling_alley",
    "bus_station",
    "cafe",
    "campground",
    "car_dealer",
    "car_rental",
    "car_repair",
    "car_wash",
    "casino",
    "cemetery",
    "church",
    "city_hall",
    "clothing_store",
    "convenience_store",
    "courthouse",
    "dentist",
    "department_store",
    "doctor",
    "drugstore",
    "electrician",
    "electronics_store",
    "embassy",
    "fire_station",
    "florist",
    "funeral_home",
    "furniture_store",
    "gas_station",
    "gym",
    "hair_care",
    "hardware_store",
    "hindu_temple",
    "home_goods_store",
    "hospital",
    "insurance_agency",
    "jewelry_store",
    "laundry",
    "lawyer",
    "library",
    "light_rail_station",
    "liquor_store",
    "local_government_office",
    "locksmith",
    "lodging",
    "meal_delivery",
    "meal_takeaway",
    "mosque",
    "movie_rental",
    "movie_theater",
    "moving_company",
    "museum",
    "night_club",
    "painter",
    "park",
    "parking",
    "pet_store",
    "pharmacy",
    "physiotherapist",
    "plumber",
    "police",
    "post_office",
    "primary_school",
    "real_estate_agency",
    "restaurant",
    "roofing_contractor",
    "rv_park",
    "school",
    "secondary_school",
    "shoe_store",
    "shopping_mall",
    "spa",
    "stadium",
    "storage",
    "store",
    "subway_station",
    "supermarket",
    "synagogue",
    "taxi_stand",
    "tourist_attraction",
    "train_station",
    "transit_station",
    "travel_agency",
    "university",
    "veterinary_care",
    "zoo",
  ];
  List<Position> locations = <Position>[];
  LocationRepository locationRepository = LocationRepository();
  PlaceRepository placeRepository = PlaceRepository();

  // Location Tracker is called every 15 min by Workamanger
  void locationTimeTracker() async {
    Position? last = await locationRepository.fetchLastPosition();
    if (last != null) {
      Position current = await locationRepository.fetchPosition();
      if (current == last) {
        // update social duration by 15min
      }
    }
  }

  Future<List<NearBySearchResponse>> getSocialPlaces() async {
    Position current = await locationRepository.fetchPosition();
    int radius = 10;
    List<NearBySearchResponse> responeCollection = <NearBySearchResponse>[];
    for (String type in myPlaces) {
      NearBySearchResponse? response =
          await placeRepository.fetchPlaceUsingCoord(
              Location(lat: current.latitude, lng: current.longitude),
              radius,
              type);
      if (response != null) {
        responeCollection.add(response);
      }
    }
    return responeCollection;
  }
}
