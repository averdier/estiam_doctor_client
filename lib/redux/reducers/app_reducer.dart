import 'package:redux_persist/redux_persist.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:estiam_doctor_client/redux/reducers/auth_reducer.dart';
import 'package:estiam_doctor_client/redux/reducers/doctor_reducer.dart';
import 'package:estiam_doctor_client/redux/reducers/schedule_reducer.dart';

AppState appReducer(AppState state, action) {
  if (action is PersistLoadedAction<AppState>) {
    return action.state ?? state;
  }
  else {
    return new AppState(
      auth: authReducer(state.auth, action),
      doctor: doctorReducer(state.doctor, action),
      schedule: scheduleReducer(state.schedule, action)
    );
  }
}