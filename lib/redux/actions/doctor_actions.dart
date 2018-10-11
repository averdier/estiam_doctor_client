import 'package:estiam_doctor_client/models/doctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// On doctor request
class DoctorRequest {
  final String name;
  final String officeName;
  final String phoneNumber;
  final String userId;

  /// Constructor
  DoctorRequest(this.name, this.officeName, this.phoneNumber, this.userId);
}

/// On doctor request success
class DoctorRequestSuccess {
  final Doctor doctor;

  /// Constructor
  DoctorRequestSuccess(this.doctor);
}

/// On doctor request failure
class DoctorRequestFailure {
  final String error;

  /// Constructor
  DoctorRequestFailure(this.error);
}

/// On doctor list request
class DoctorListRequest {}

/// On doctor list request success
class DoctorListRequestSuccess {
  final List<Doctor> doctors;

  /// Constructor
  DoctorListRequestSuccess(this.doctors);
}

/// On doctor list request failure
class DoctorListRequestFailure {
  final String error;

  /// Constructor
  DoctorListRequestFailure(this.error);
}

