import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

final auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;

Future<UserModel?> readUser() async {
  final currentUid = auth.currentUser!.uid;
  final userDoc = db.collection('users').doc(currentUid);
  final userSnap = await userDoc.get();

  return UserModel.fromMap(userSnap.data()!);
}
