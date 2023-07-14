import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/device_model.dart';

final auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;

Stream<List<DeviceModel>> readDevices() {
  final currentUid = auth.currentUser!.uid;
  return db
      .collection('devices')
      .where('userID', isEqualTo: currentUid)
      .orderBy('dateAdded', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => DeviceModel.fromMap(doc.data())).toList());
}
