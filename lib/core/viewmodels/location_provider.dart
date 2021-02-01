import 'package:flutter/material.dart';
import 'package:irwan_pingpong/core/utils/location_utils.dart';
import 'package:irwan_pingpong/injector.dart';

class LocationProvider extends ChangeNotifier {
  //* ----------------------------
  //* This is side for property data
  //* ----------------------------

  //* Location Address
  String _address;
  String get address => _address;

  //* Location Coordinate
  double _latitude;
  double get latitude => _latitude;
  double _longitude;
  double get longitude => _longitude;

  //* Dependency Injection
  LocationUtils locationUtils = locator<LocationUtils>();

  //* ----------------------------
  //* Function field
  //* ----------------------------

  /// Function to load location from GPS and address
  void loadLocation() async {
    await locationUtils.getLocation();

    _address = await locationUtils.getAddress();
    _latitude = locationUtils.latitude;
    _longitude = locationUtils.longitude;
    notifyListeners();
  }
}