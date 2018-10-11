
import 'package:estiam_doctor_client/models/schedule.dart';

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

class SchedulePossibleListRequest {
  final String doctorId;
  final DateTime dateTime;

  SchedulePossibleListRequest(this.doctorId, this.dateTime);
}

class SchedulePossibleListRequestSuccess {
  final List<DateTime> possibles;

  SchedulePossibleListRequestSuccess(this.possibles);
}

class SchedulePossibleListRequestFailure {
  final String error;

  SchedulePossibleListRequestFailure(this.error);
}
