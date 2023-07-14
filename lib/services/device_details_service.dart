import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/device_model.dart';

final auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;

Future<DeviceModel?> readDevice(String currentDeviceID) async {
  final deviceDoc = db.collection('devices').doc(currentDeviceID);
  final deviceSnap = await deviceDoc.get();

  return DeviceModel.fromMap(deviceSnap.data()!);
}
