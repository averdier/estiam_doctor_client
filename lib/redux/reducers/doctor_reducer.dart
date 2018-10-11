import 'package:estiam_doctor_client/redux/actions/doctor_actions.dart';
import 'package:estiam_doctor_client/redux/models/doctor_state.dart';
import 'package:redux/redux.dart';


Reducer<DoctorState> doctorReducer = combineReducers([
  new TypedReducer<DoctorState, DoctorListRequestSuccess>(getDoctorListSuccessReducer),
  new TypedReducer<DoctorState, DoctorListRequestFailure>(getDoctorListFailureReducer),
  new TypedReducer<DoctorState, DoctorRequestSuccess>(getDoctorRequestSuccessReducer),
  new TypedReducer<DoctorState, DoctorRequestFailure>(getDoctorRequestFailureReducer),
]);


DoctorState getDoctorListSuccessReducer(DoctorState state, DoctorListRequestSuccess action) {
  return state.copyWith(
    doctors: action.doctors,
    selectedDoctor: null,
  );
}

DoctorState getDoctorListFailureReducer(DoctorState state, DoctorListRequestFailure action) {
  return state.copyWith(
    error: action.error
  );
}

DoctorState getDoctorRequestSuccessReducer(DoctorState state, DoctorRequestSuccess action) {
  return state.copyWith(
    selectedDoctor: action.doctor
  );
}

DoctorState getDoctorRequestFailureReducer(DoctorState state, DoctorRequestFailure action) {
  return state.copyWith(
    selectedDoctor: null,
    error: action.error
  );
}
