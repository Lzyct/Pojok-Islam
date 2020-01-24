import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  @override
  LocationState get initialState => GetLocationState("Unknown Location");

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is GetLocationEvent) {
      yield GetLocationLoading();
      var _placeMarks = await getLocation();

      await Future.delayed(Duration(seconds: 2));
      yield GetLocationState(_placeMarks[0].subAdministrativeArea +
          " , " +
          _placeMarks[0].country);
    }
  }

  Future<List<Placemark>> getLocation() async {
    var isGranted = await getPermissionStatus();
    Logger().d("is granted ? $isGranted");
    if (isGranted) {
      Position _position;
      Geolocator _geoLocator = Geolocator();
      _position = await _geoLocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      List<Placemark> _placemark = await _geoLocator.placemarkFromCoordinates(
          _position.latitude, _position.longitude);

      Logger().d("country" + _placemark[0].country);
      Logger().d("position" + _placemark[0].position.toString());
      Logger().d("locality" + _placemark[0].locality);
      Logger().d("administrativeArea" + _placemark[0].administrativeArea);
      Logger().d("postalCode" + _placemark[0].postalCode);
      Logger().d("name" + _placemark[0].name);
      Logger().d("subAdministrativeArea" + _placemark[0].subAdministrativeArea);
      Logger().d("isoCountryCode" + _placemark[0].isoCountryCode);
      Logger().d("subLocality" + _placemark[0].subLocality);
      Logger().d("subThoroughfare" + _placemark[0].subThoroughfare);
      Logger().d("thoroughfare" + _placemark[0].thoroughfare);
      return _placemark;
    } else
      return null;
  }

  Future<bool> getPermissionStatus() async {
    try {
      var isGranted = false;
      PermissionStatus _permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.locationWhenInUse);
      Logger().d(_permission);
      if (_permission == PermissionStatus.granted) {
        isGranted = true;
      } else if (_permission == PermissionStatus.denied ||
          _permission == PermissionStatus.disabled ||
          _permission == PermissionStatus.restricted ||
          _permission == PermissionStatus.unknown) {
        await PermissionHandler().requestPermissions(
            [PermissionGroup.locationWhenInUse]).then((status) {
          isGranted = true;
        });
      }
      return isGranted;
    } catch (e) {
      Logger().d("error : " + e);
      return false;
    }
  }
}
