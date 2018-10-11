import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String name;
  final String officeName;
  final String phoneNumber;
  final String userId;

  /// Constructor
  Doctor(this.name, this.officeName, this.phoneNumber, this.userId);

  /// Get doctor in JSON
  Map<String, dynamic> toJSON() => <String, dynamic> {
    'name': this.name,
    'officeName': this.officeName,
    'phoneNumber': this.phoneNumber,
    'userId': this.userId
  };

  /// Create doctor from JSON
  factory Doctor.fromJSON(Map<String, dynamic> json) => new Doctor(
      json['name'], json['officeName'], json['phoneNumber'], json['userId']
  );

  @override
  String toString() {
    return '{name: $name, officeName: $officeName, phoneNumber: $phoneNumber}';
  }

  factory Doctor.fromSnapshot(DocumentSnapshot snap) => new Doctor(
      snap['name'], snap['officeName'], snap['phoneNumber'], snap['userId']
  );
}