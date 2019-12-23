import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => GetLocationState("Unknown Location");

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      if (event is GetLocationEvent) {
        getPermissionStatus();
        var _placeMarks = await getLocation();

        yield GetLocationState(
            _placeMarks[0].locality + " , " + _placeMarks[0].country);
      }
    } catch (_) {
      print(_);
    }
  }

  Future<List<Placemark>> getLocation() async {
    Position _position;
    Geolocator _geoLocator = Geolocator();
    _position = await _geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    List<Placemark> _placemark = await _geoLocator.placemarkFromCoordinates(
        _position.latitude, _position.longitude);

    print(_placemark[0].country);
    print(_placemark[0].position);
    print(_placemark[0].locality);
    print(_placemark[0].administrativeArea);
    print(_placemark[0].postalCode);
    print(_placemark[0].name);
    print(_placemark[0].subAdministrativeArea);
    print(_placemark[0].isoCountryCode);
    print(_placemark[0].subLocality);
    print(_placemark[0].subThoroughfare);
    print(_placemark[0].thoroughfare);
    return _placemark;
  }

  void getPermissionStatus() async {
    try {
      PermissionStatus _permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.locationWhenInUse);
      print(_permission);
      if (_permission == PermissionStatus.granted) {
      } else if (_permission == PermissionStatus.denied ||
          _permission == PermissionStatus.disabled ||
          _permission == PermissionStatus.restricted ||
          _permission == PermissionStatus.unknown) {
        await PermissionHandler()
            .requestPermissions([PermissionGroup.locationWhenInUse]);
        getPermissionStatus();
      }
    } catch (e) {
      print(e);
    }
  }
}
