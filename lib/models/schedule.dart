import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  final String clientId;
  final String clientName;
  final String clientPhoneNumber;
  final String doctorId;
  final DateTime reservationDatetime;

  Schedule(this.clientId, this.clientName, this.clientPhoneNumber, this.doctorId, this.reservationDatetime);

  Map<String, dynamic> toJSON() => <String, dynamic> {
    'clientId': this.clientId,
    'clientName': this.clientName,
    'clientPhoneNumber': this.clientPhoneNumber,
    'doctorId': this.doctorId,
    'reservationDateTime': this.reservationDatetime
  };

  factory Schedule.fromJSON(Map<String, dynamic> json) => new Schedule(
      json['clientId'], json['clientName'], json['clientPhoneNumber'], json['doctorId'], json['reservationDateTime']
  );

  factory Schedule.fromSnapshot(DocumentSnapshot snap) => new Schedule(
      snap['clientId'], snap['clientName'], snap['clientPhoneNumber'], snap['doctorId'], snap['reservationDateTime']
  );

  @override
  String toString() {
    return '{clientId: $clientId, clientName: $clientId, clientPhoneNumber: $clientPhoneNumber, doctorId: $doctorId, reservationDateTime: $reservationDatetime}';
  }
}