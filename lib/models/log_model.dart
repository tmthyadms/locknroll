import 'package:cloud_firestore/cloud_firestore.dart';

class LogModel {
  final String deviceID;
  final bool wasEnabled;
  final bool wasLocked;
  final String wasImageCaptured;
  final String wasAlarmActivated;
  final DateTime dateOccured;

  LogModel({
    required this.deviceID,
    required this.wasEnabled,
    required this.wasLocked,
    required this.wasImageCaptured,
    required this.wasAlarmActivated,
    required this.dateOccured,
  });

  Map<String, dynamic> toMap() => {
        'deviceID': deviceID,
        'wasEnabled': wasEnabled,
        'wasLocked': wasLocked,
        'wasImageCaptured': wasImageCaptured,
        'wasAlarmActivated': wasAlarmActivated,
        'dateOccured': dateOccured,
      };

  static LogModel fromMap(Map<String, dynamic> json) => LogModel(
        deviceID: json['deviceID'],
        wasEnabled: json['wasEnabled'],
        wasLocked: json['wasLocked'],
        wasImageCaptured: json['wasImageCaptured'],
        wasAlarmActivated: json['wasAlarmActivated'],
        dateOccured: (json['dateOccured'] as Timestamp).toDate(),
      );
}
