
import 'package:estiam_doctor_client/models/schedule.dart';
import 'package:estiam_doctor_client/models/user.dart';

/// On schedule list request
class ScheduleListRequest {
  final String doctorId;

  ScheduleListRequest(this.doctorId);
}

/// On schedule list request success
class ScheduleListRequestSuccess {
  final List<Schedule> schedules;

  ScheduleListRequestSuccess(this.schedules);
}

/// On schedule list request failure
class ScheduleListRequestFailure {
  final String error;

  ScheduleListRequestFailure(this.error);
}

class ScheduleRequest {
  final User user;
  final String doctorId;
  final DateTime dateTime;

  ScheduleRequest(this.user, this.doctorId, this.dateTime);
}

class ScheduleRequestSuccess {
  final Schedule schedule;

  ScheduleRequestSuccess(this.schedule);
}

class ScheduleRequestSuccessEmpty {}

class ScheduleRequestFailure {
  final String error;

  ScheduleRequestFailure(this.error);
}
