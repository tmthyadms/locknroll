import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String fullName;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime dateRegistered;

  UserModel({
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateRegistered,
  });

  Map<String, dynamic> toMap() => {
        'fullName': fullName,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'dateRegistered': dateRegistered,
      };

  static UserModel fromMap(Map<String, dynamic> json) => UserModel(
        fullName: json['fullName'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        dateRegistered: (json['dateRegistered'] as Timestamp).toDate(),
      );
}
