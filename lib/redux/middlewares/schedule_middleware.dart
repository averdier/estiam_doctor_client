

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estiam_doctor_client/models/schedule.dart';
import 'package:estiam_doctor_client/redux/actions/schedule_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';


List<Middleware<AppState>> createScheduleMiddleware() => <Middleware<AppState>> [
  new TypedMiddleware<AppState, ScheduleListRequest>(getSchedules)
];


final getSchedules = _getSchedules();

Middleware<AppState> _getSchedules() {
  return (Store store, action, NextDispatcher next) async {
    if (action is ScheduleListRequest) {
      QuerySnapshot querySnapshot = await Firestore.instance.collection("reservations").where('doctorId', isEqualTo: action.doctorId).getDocuments();
      var list = querySnapshot.documents;
      store.dispatch(ScheduleListRequestSuccess(list.map((i) => new Schedule.fromSnapshot(i)).toList()));
    }
  };
}

Middleware<AppState> _getPossibleSchedules() {
  return (Store store, action, NextDispatcher next) async {
    if (action is SchedulePossibleListRequest) {
      var now = DateTime.now();
      QuerySnapshot querySnapshot = await Firestore.instance.collection("reservations").orderBy('reservationDateTime').startAt([new DateTime.utc(now.year, now.month, now.day)]).where('doctorId', isEqualTo: action.doctorId).getDocuments();

      var list = querySnapshot.documents.map((i) => new Schedule.fromSnapshot(i)).toList();
      List<DateTime> possibles = new List<DateTime>();

      var start = DateTime.utc(now.year, now.month, now.day, 9);

      for (var i = 0; i < list.length; i++) {

      }
    }
  };
}

List<DateTime> getPossibles(DateTime start, DateTime end) {

}