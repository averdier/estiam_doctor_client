import 'package:meta/meta.dart';
import 'package:estiam_doctor_client/models/doctor.dart';
import 'package:estiam_doctor_client/models/schedule.dart';
import 'package:estiam_doctor_client/redux/models/auth_state.dart';
import 'package:estiam_doctor_client/redux/models/doctor_state.dart';
import 'package:estiam_doctor_client/redux/models/schedule_state.dart';

@immutable
class AppState {
  final AuthState auth;
  final DoctorState doctor;
  final ScheduleState schedule;

  /// Constructor
  AppState({AuthState auth, DoctorState doctor, ScheduleState schedule}):
        auth = auth ?? new AuthState(),
        doctor = doctor ?? new DoctorState(doctors: new List<Doctor>()),
        schedule = schedule ?? new ScheduleState(schedules: new List<Schedule>());

  static AppState rehydrationJSON(dynamic json) => new AppState(
      auth: new AuthState.fromJSON(json['auth']),
      doctor: new DoctorState.fromJSON(json['doctor']),
      schedule: new ScheduleState.fromJSOM(json['schedule'])
  );

  /// Return current state in JSON
  Map<String, dynamic> toJson() => {
    'auth': auth.toJSON(),
    'doctor': doctor.toJSON(),
    'schedule': schedule.toJSON()
  };

  /// Return copy of state
  AppState copyWith({
    bool rehydrated,
    AuthState auth,
    DoctorState doctor,
    ScheduleState schedule
  }) {
    return new AppState(
        auth: auth ?? this.auth,
        doctor: doctor ?? this.doctor,
        schedule: schedule ?? this.schedule
    );
  }

  @override
  String toString() {
    return '''AppState{
            auth: $auth,
            doctor: $doctor,
            'schedule: $schedule
        }''';
  }
}