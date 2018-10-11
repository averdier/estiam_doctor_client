import 'package:meta/meta.dart';
import 'package:estiam_doctor_client/models/doctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class DoctorState {

  final List<Doctor> doctors;
  final Doctor selectedDoctor;
  final String error;

  /// Constructor
  DoctorState({
    this.doctors,
    this.selectedDoctor,
    this.error
  });

  DoctorState copyWith({
    List<Doctor> doctors,
    Doctor selectedDoctor,
    String error
  }) {
    return new DoctorState(
      doctors: doctors ?? this.doctors,
      selectedDoctor: selectedDoctor ?? this.selectedDoctor,
      error: error ?? this.error
    );
  }

  factory DoctorState.fromJSON(Map<String, dynamic> json) => new DoctorState(
    doctors: (json['doctors'] as List).map((i) => new Doctor.fromJSON(i)).toList(),
    selectedDoctor: json['selectedDoctor'] != null ? Doctor.fromJSON(json['selectedDoctor']) : null,
    error: json['error']
  );

  Map<String, dynamic> toJSON() => <String, dynamic>{
    'doctors': this.doctors.map((doctor) {
      return doctor.toJSON();
    }).toList(),
    'selectedDoctor': this.selectedDoctor!= null ? this.selectedDoctor.toJSON() : null,
    'error': this.error
  };

  @override
  String toString() {
    return '''{
                doctors: $doctors,
                selectedDoctor: $selectedDoctor,
                error: $error
            }''';
  }
}
