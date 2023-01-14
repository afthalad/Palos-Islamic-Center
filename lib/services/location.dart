import 'package:flutter/material.dart';

import 'package:location/location.dart';

import '../widgets/widgets.dart';

class LocationService {
  final BuildContext context;
  LocationService(this.context);
  var userCoorLat = 0.0;
  var userCoorLong = 0.0;

  Future<void> getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    userCoorLat = _locationData.latitude!;
    userCoorLong = _locationData.longitude!;
  }
}
