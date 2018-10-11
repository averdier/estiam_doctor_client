import 'package:estiam_doctor_client/redux/actions/schedule_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:intl/intl.dart';


class DoctorAppointmentForm extends StatefulWidget {
  @override
  _DoctorAppointmentFormState createState() => new _DoctorAppointmentFormState();
}

class _DoctorAppointmentFormState extends State<DoctorAppointmentForm> {
  final formKey = new GlobalKey<FormState> ();
  final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  final timeFormat = DateFormat("h:mm a");

  DateTime _dateTime;
  TimeOfDay _timeOfDay;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: formKey,
      child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text("Choisir le créneau", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text("Jour", style: new TextStyle(fontWeight: FontWeight.bold)),
          ),
          DateTimePickerFormField(
            format: dateFormat,
            validator: (val) => val == null ? 'Please enter date' : null,
            onSaved: (val) => _dateTime = val,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text("Horaire", style: new TextStyle(fontWeight: FontWeight.bold)),
          ),
          TimePickerFormField(
            format: timeFormat,
            validator: (val) => val == null ? 'Please enter time' : null,
            onSaved: (val) => _timeOfDay = val,
          ),

          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: RaisedButton(
                  child: new Text('Sauvegarder'),
                  onPressed: () {
                    _submit();
                    StoreProvider.of<AppState>(context).dispatch(new ScheduleRequest(
                      StoreProvider.of<AppState>(context).state.auth.user,
                        StoreProvider.of<AppState>(context).state.doctor.selectedDoctor.userId,
                      new DateTime.utc(_dateTime.year, _dateTime.month, _dateTime.day, _timeOfDay.hour, _timeOfDay.minute)
                    ));
                  }
                ),
              )
          )
        ],
      )
    );
  }
}
