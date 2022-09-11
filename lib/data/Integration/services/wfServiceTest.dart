import 'package:beat/data/Integration/services/wfService.dart';

class WFServiceTest {
  WFService wf = WFService();
  Future<Uri?> weFitterTestSequencePart1() async {
    //print("Getting admin bearer token");
    String adminBearer = await wf.requestAdminBearerToken();
    //print("Admin bearer token $adminBearer");
    //print("Creating and integrating the WF profile with BEAT");
    final response = await wf.createProfile(adminBearer);
    await wf.integrateUser(response);
    //print("Integrations Type loaded as $ints");
    //print("preparing a connection url for use");
    Uri? uri = await wf.requestConnectionURL();
    //Use this URI to open the inAppBrowser and authorize WeFitters access
    return uri;
  }

  //This can only be done after weFitter is authorized to access Strava
  Future<void> weFitterTestSequencePart2() async {
    // print("Mapping the workouts of the profile to Beat activities");
    await wf.mapWFWorkoutToBeatActivity();
  }
}
