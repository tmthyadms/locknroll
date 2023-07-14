import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/event_type.dart';
import '../utils/event_type_map.dart';

class LogModel {
  final String deviceID;
  final EventType eventType;
  final DateTime dateOccured;

  LogModel({
    required this.deviceID,
    required this.eventType,
    required this.dateOccured,
  });

  Map<String, dynamic> toMap() => {
        'deviceID': deviceID,
        'eventType': eventType.toString().split('.').last,
        'dateOccured': dateOccured,
      };

  static LogModel fromMap(Map<String, dynamic> json) => LogModel(
        deviceID: json['deviceID'],
        eventType: eventTypeMap(json['eventType']),
        dateOccured: (json['dateOccured'] as Timestamp).toDate(),
      );
}
