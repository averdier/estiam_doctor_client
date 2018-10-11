import 'package:meta/meta.dart';
import 'package:estiam_doctor_client/models/doctor.dart';
import 'package:estiam_doctor_client/redux/models/auth_state.dart';
import 'package:estiam_doctor_client/redux/models/doctor_state.dart';

@immutable
class AppState {
  final AuthState auth;
  final DoctorState doctor;

  /// Constructor
  AppState({AuthState auth, DoctorState doctor}):
        auth = auth ?? new AuthState(),
        doctor = doctor ?? new DoctorState(doctors: new List<Doctor>());

  static AppState rehydrationJSON(dynamic json) => new AppState(
      auth: new AuthState.fromJSON(json['auth']),
      doctor: new DoctorState.fromJSON(json['doctor'])
  );

  /// Return current state in JSON
  Map<String, dynamic> toJson() => {
    'auth': auth.toJSON(),
    'doctor': doctor.toJSON()
  };

  /// Return copy of state
  AppState copyWith({
    bool rehydrated,
    AuthState auth,
    DoctorState doctor,
  }) {
    return new AppState(
        auth: auth ?? this.auth,
        doctor: doctor ?? this.doctor
    );
  }

  @override
  String toString() {
    return '''AppState{
            auth: $auth,
            doctor: $doctor
        }''';
  }
}