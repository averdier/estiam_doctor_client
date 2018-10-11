import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:estiam_doctor_client/views/components/main_drawer.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';


void main() => runApp(new DoctorAppointmentScreen());

class DoctorAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Prendre rendez-vous',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new DoctorAppointmentScreenHome(title: 'Prendre rendez-vous'),
    );
  }
}

class DoctorAppointmentScreenHome extends StatefulWidget {
  DoctorAppointmentScreenHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DoctorAppointmentScreenState createState() => new _DoctorAppointmentScreenState();
}

// Page détail d'un docteur
class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreenHome> {
  final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  final timeFormat = DateFormat("h:mm a");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Prendre rendez-vous'),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text('Médecin', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("Dr. Sullivan Fabre"),
                    ),
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
                      onChanged: (date) {
                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('$date')));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("Horaire", style: new TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    TimePickerFormField(
                      format: timeFormat,
                      onChanged: (time) {
                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('$time')));
                      },
                    ),

                    DateTimePickerFormField(
                      format: dateFormat,
                      enabled: false,
                    ),
                    TimePickerFormField(
                      format: toDateFormat(TimeOfDayFormat.HH_colon_mm),
                      enabled: false,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: RaisedButton(
                              child: new Text('Sauvegarder'),
                              onPressed: null,
                              /*onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DoctorAppointmentScreen()),
                                );
                              }*/
                          ),
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: new MainDrawer(),
    );
  }
}