import 'package:cloud_firestore/cloud_firestore.dart';

class DeviceModel {
  final String deviceID;
  final String userID;
  final String name;
  final bool isEnabled;
  final bool isLocked;
  final DateTime dateAdded;

  DeviceModel({
    required this.deviceID,
    required this.userID,
    required this.name,
    required this.isEnabled,
    required this.isLocked,
    required this.dateAdded,
  });

  Map<String, dynamic> toMap() => {
        'deviceID': deviceID,
        'name': name,
        'isEnabled': isEnabled,
        'isLocked': isLocked,
        'dateAdded': dateAdded,
      };

  static DeviceModel fromMap(Map<String, dynamic> json) => DeviceModel(
        deviceID: json['deviceID'],
        userID: json['userID'],
        name: json['name'],
        isEnabled: json['isEnabled'],
        isLocked: json['isLocked'],
        dateAdded: (json['dateAdded'] as Timestamp).toDate(),
      );
}
