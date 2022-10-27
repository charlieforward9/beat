import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import 'package:beat/data/Geolocation/GeolocationRepository.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;

  //TODO Test
  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationLoading()) {
    on<LoadGeolocation>((event, emit) async {
      final Position position =await _geolocationRepository.getCurrentLocation();
      add(UpdateGeolocation(position: position));
    });
    on<UpdateGeolocation>((event, emit) {
      emit(GeolocationLoaded(position: event.position));
    });
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }

  void presentLocation() {
    _geolocationSubscription = Geolocator.getPositionStream()
        .listen((pos) => add(UpdateGeolocation(position: pos)));
  }
}
