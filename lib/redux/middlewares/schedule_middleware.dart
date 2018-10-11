

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estiam_doctor_client/models/schedule.dart';
import 'package:estiam_doctor_client/redux/actions/schedule_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';


List<Middleware<AppState>> createScheduleMiddleware() => <Middleware<AppState>> [
  new TypedMiddleware<AppState, ScheduleListRequest>(getSchedules),
  new TypedMiddleware<AppState, ScheduleRequest>(doSchedule),
];


final getSchedules = _getSchedules();
final doSchedule = _doSchedule();

Middleware<AppState> _getSchedules() {
  return (Store store, action, NextDispatcher next) async {
    if (action is ScheduleListRequest) {
      QuerySnapshot querySnapshot = await Firestore.instance.collection("reservations").where('userId', isEqualTo: action.doctorId).getDocuments();
      var list = querySnapshot.documents;
      store.dispatch(ScheduleListRequestSuccess(list.map((i) => new Schedule.fromSnapshot(i)).toList()));
    }
  };
}

Middleware<AppState> _doSchedule() {
  return (Store store, action, NextDispatcher next) async {
    print('========================================================');
    if (action is ScheduleRequest) {
      QuerySnapshot querySnapshot = await Firestore.instance.collection("reservations").orderBy('reservationDateTime').startAt([action.dateTime.add(new Duration(minutes: -30))]).endAt([action.dateTime.add(new Duration(minutes: 30))]).where('userId', isEqualTo: action.doctorId).getDocuments();

      var list = querySnapshot.documents.map((i) => new Schedule.fromSnapshot(i)).toList();
      print('========================================================');
      if (list.length == 0) {
        var schedule = new Schedule(action.user.id, action.user.name, action.user.phone, action.doctorId, action.dateTime);
        Firestore.instance.collection('reservations').document().setData(schedule.toJSON());
        //store.dispatch(ScheduleRequestSuccess(schedule));
        store.dispatch(ScheduleRequestSuccessEmpty());
      }
      else {
        store.dispatch(ScheduleRequestFailure('Already exist'));
      }
    }
  };
}