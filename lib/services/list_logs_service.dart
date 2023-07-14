import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/log_model.dart';

final auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;

Stream<List<LogModel>> readLogs(String currentDeviceID) {
  return db
      .collection('logs')
      .where('deviceID', isEqualTo: currentDeviceID)
      .orderBy('dateOccured', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => LogModel.fromMap(doc.data())).toList());
}
