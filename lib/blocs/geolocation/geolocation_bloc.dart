import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import 'package:beat/data/Geolocation/GeolocationService.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationService _geolocationService;
  StreamSubscription? _geolocationSubscription;

//TODO Current https://bloclibrary.dev/#/migration?id=v800
  GeolocationBloc({required GeolocationService geolocationService})
      : _geolocationService = geolocationService,
        super(GeolocationLoading()) {
          on<LoadGeolocation>(((event, emit) => _mapLoadGeolocationToState));
        //on<LoadGeolocation>(((event, emit) { emit(_mapLoadGeolocationToState());}));
  }

  @override
  Stream<GeolocationState> mapEventToState(GeolocationEvent event) async* {
    if (event is LoadGeolocation) {
      //yield* _mapLoadGeolocationToState();
    } else if (event is UpdateGeolocation) {
      yield* _mapUpdateGeolocationToState(event);
    }
  }

  void _mapLoadGeolocationToState(LoadGeolocation event, Emitter<GeolocationState> emit) async {
    final Position position = await _geolocationService.getCurrentLocation();
    add(UpdateGeolocation(position: position));
    emit(GeolocationLoaded(position: position));
  }

  Stream<GeolocationState> _mapUpdateGeolocationToState(
      UpdateGeolocation event) async* {
    yield GeolocationLoaded(position: event.position);
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
