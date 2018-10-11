import 'package:estiam_doctor_client/models/doctor.dart';
import 'package:estiam_doctor_client/redux/actions/doctor_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<Middleware<AppState>> createDoctorMiddleware() => <Middleware<AppState>>[
  new TypedMiddleware<AppState, DoctorListRequest>(getDoctors),
  new TypedMiddleware<AppState, DoctorRequest>(getDoctor)
];

final getDoctors = _getDoctors();
final getDoctor = _getDoctor();

/// Get doctors
Middleware<AppState> _getDoctors() {
  return (Store store, action, NextDispatcher next) async {
    if (action is DoctorListRequest) {
      QuerySnapshot _doctors = await Firestore.instance.collection('doctors').getDocuments();
      var list = _doctors.documents;
      store.dispatch(DoctorListRequestSuccess(list.map((i) => new Doctor.fromSnapshot(i)).toList()));
    }
  };
}

/// Get doctor
Middleware<AppState> _getDoctor() {
  return (Store store, action, NextDispatcher next) async {
    if (action is DoctorRequest) {
      store.dispatch(DoctorRequestSuccess(new Doctor(action.name, action.officeName, action.phoneNumber, action.userId)));
    }
  };
}