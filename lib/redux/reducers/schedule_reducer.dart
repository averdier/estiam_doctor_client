import 'package:estiam_doctor_client/redux/actions/schedule_actions.dart';
import 'package:estiam_doctor_client/redux/models/schedule_state.dart';
import 'package:redux/redux.dart';


Reducer<ScheduleState> scheduleReducer = combineReducers([
  new TypedReducer<ScheduleState, ScheduleRequestSuccessEmpty>(getScheduleSuccessReducer),
  new TypedReducer<ScheduleState, ScheduleRequestFailure>(getScheduleFailureReducer),
]);


ScheduleState getScheduleSuccessReducer(ScheduleState state, ScheduleRequestSuccessEmpty action) {
  return state.copyWith();
}

ScheduleState getScheduleFailureReducer(ScheduleState state, ScheduleRequestFailure action) {
  return state.copyWith(error: action.error);
}