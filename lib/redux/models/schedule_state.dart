import 'package:estiam_doctor_client/models/schedule.dart';
import 'package:meta/meta.dart';

@immutable
class ScheduleState {
  final List<Schedule> schedules;
  final List<DateTime> possibles;
  final String error;

  ScheduleState({
    this.schedules,
    this.possibles,
    this.error,
  });

  ScheduleState copyWith({
    List<Schedule> schedules,
    List<DateTime> possibles,
    String error,
  }) {
    return new ScheduleState(
      schedules: schedules ?? this.schedules,
      possibles: possibles ?? this.possibles,
      error: error ?? this.error
    );
  }

  factory ScheduleState.fromJSOM(Map<String, dynamic> json) => new ScheduleState(
    schedules: (json['schedules'] as List).map((i) => new Schedule.fromJSON(i)).toList(),
    possibles: json['possibles'] as List,
    error: json['error']
  );

  Map<String, dynamic> toJSON() => <String, dynamic> {
    'schedules': this.schedules.map((schedule) {
      return schedule.toJSON();
    }).toList(),
    'possibles': this.possibles,
    'error': this.error
  };

  @override
  String toString() {
    return '''{
                schedules: $schedules,
                possibles: $possibles,
                error: $error
            }''';
  }
}