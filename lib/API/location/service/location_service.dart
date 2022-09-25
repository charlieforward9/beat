import 'package:beat/API/location/repository/location_repository.dart';
import 'package:beat/API/places/service/place_service.dart';
import 'package:beat/data/Activity/services/ActivityService.dart';
import 'package:beat/data/DateTimeService.dart';
import 'package:beat/data/Goal/services/GoalService.dart';
import 'package:beat/models/CategoryTypes.dart';
import 'package:beat/models/DurationBeat.dart';
import 'package:beat/models/ModelProvider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';

class LocationService {
  LocationRepository locationRepository = LocationRepository();
  PlaceService placeService = PlaceService();
  ActivityService activityService = ActivityService();
  GoalService goalService = GoalService();
  DTService dtService = DTService();

  void compareLocations() async {
    Position present = await locationRepository.fetchPosition();
    Position? last = await locationRepository.fetchLastPosition();
    if (last != null) {
      if (last == present) {
        String userID = "";
        Goal goal =
            await goalService.getGoal(userID, CategoryTypes.SOCIAL, null);
        List<Activity> activities =
            await activityService.getActivitiesByGoalID(goal.id);

        // check social activities exist
        if (activities.isNotEmpty) {
          Activity activity = activities[
              0]; // last activity, ideally update activity based on location metrics ?
          DurationBeat currentDuration = activity.activityDuration;

          // adjust durations todo: test
          DurationBeat newDuration = DurationBeat(
              hours: currentDuration.hours,
              minutes: currentDuration.minutes! + 15,
              seconds: currentDuration.seconds);

          activityService.updateActivityDuration(activity.id, newDuration);
        }
        return;
      }
    }
    List<NearBySearchResponse> places = await placeService.getSocialPlaces();
    if (places.isNotEmpty) {
      String userID = "";
      Goal goal = await goalService.getGoal(userID, CategoryTypes.SOCIAL, null);
      activityService.createActivity(
          dtService.localD,
          dtService.utcDT,
          CategoryTypes.SOCIAL,
          DurationBeat(hours: 0, minutes: 1, seconds: 0),
          goal.id);
    }
  }
}
