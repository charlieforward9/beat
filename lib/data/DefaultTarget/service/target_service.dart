import 'dart:developer';

import 'package:beat/config/global.dart';
import 'package:beat/data/DefaultTarget/repository/target_repository.dart';
import 'package:beat/models/ModelProvider.dart';

class DefaultTargetService {
  final DefaultTargetRepository _repo = DefaultTargetRepository();

  void logCurrentUserDefaultTarget() {
    log("access by importing <lib/config/global> and calling defaulyTargets \n $defaultTargets ",
        name: "Current User Targets");
  }

  ///If the [_defaultTarget] parameter is set, ensure [firstTime] property is set to false. This tells the application that the user has already set goals, will not look for any
  Future<DefaultTargets> createDefaultTargets(
      DefaultTargets? defaultTarget) async {
    defaultTarget ??= DefaultTargets(
        firstTime: true,
        fitness: DurationBeat(hours: 1, minutes: 0, seconds: 0),
        fuel: DurationBeat(hours: 1, minutes: 0, seconds: 0),
        productivity: DurationBeat(hours: 8, minutes: 0, seconds: 0),
        social: DurationBeat(hours: 8, minutes: 0, seconds: 0),
        rest: DurationBeat(hours: 1, minutes: 0, seconds: 0));
    return await _repo.saveDefaultTargets(defaultTarget);
  }

  Future<void> initDefaultTargets(String _id) async {
    await getDefaultTargets(_id).then((_defaultTargets) =>
        {defaultTargets = _defaultTargets, logCurrentUserDefaultTarget()});
  }

  Future<Map<CategoryTypes, DurationBeat>> getDefaultTargets(String _id) async {
    return await _repo.fetchDefaultTargets(_id).then((data) {
      late Map<CategoryTypes, DurationBeat> defaultTargets = {};
      defaultTargets[CategoryTypes.FITNESS] = data.fitness;
      defaultTargets[CategoryTypes.FUEL] = data.fuel;
      defaultTargets[CategoryTypes.PRODUCTIVITY] = data.productivity;
      defaultTargets[CategoryTypes.SOCIAL] = data.social;
      defaultTargets[CategoryTypes.REST] = data.rest;
      return defaultTargets;
    });
  }

  Future<DefaultTargets> updateDefaultTargets(DefaultTargets _defaultTargets,
      CategoryTypes category, DurationBeat duration) async {
    _defaultTargets = _defaultTargets.copyWith(firstTime: false);

    switch (category.name.toLowerCase()) {
      case 'fitness':
        _defaultTargets = _defaultTargets.copyWith(fitness: duration);
        break;
      case 'fuel':
        _defaultTargets = _defaultTargets.copyWith(fuel: duration);
        break;
      case 'productivity':
        _defaultTargets = _defaultTargets.copyWith(productivity: duration);
        break;
      case 'social':
        _defaultTargets = _defaultTargets.copyWith(social: duration);
        break;
      case 'rest':
        _defaultTargets = _defaultTargets.copyWith(rest: duration);
        break;
      default:
        throw ("Invalid category type to set a new duration to");
    }
    return await createDefaultTargets(_defaultTargets);
  }
}
