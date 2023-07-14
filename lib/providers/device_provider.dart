import 'package:flutter/material.dart';

class DeviceProvider with ChangeNotifier {
  String _deviceID = '';

  set currentDeviceID(String selectedDeviceID) {
    _deviceID = selectedDeviceID;
    print('Device ID: $_deviceID');
    notifyListeners();
  }

  String get currentDeviceID => _deviceID;
}
