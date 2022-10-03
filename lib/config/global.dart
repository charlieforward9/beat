//USE THE IMPORT STATEMENT STUCTURE BELOW
//import <globalFilePath> as global
// For variables used across multiple locations in the app
//
//
//
//
import '../models/ModelProvider.dart';

const String userAgent =
    "Mozilla/5.0 (Linux; Android 9; LG-H870 Build/PKQ1.190522.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36";

late User currentUser;
late Integrations currentUserIntegrations;

//TODO Amplify data model
Map<CategoryTypes, DurationBeat> defaultTargets = {
  CategoryTypes.FITNESS: DurationBeat(hours: 1),
  CategoryTypes.FUEL: DurationBeat(hours: 1),
  CategoryTypes.PRODUCTIVITY: DurationBeat(hours: 8),
  CategoryTypes.REST: DurationBeat(hours: 8),
  CategoryTypes.SOCIAL: DurationBeat(hours: 1),
};
