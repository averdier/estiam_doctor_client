import 'package:estiam_doctor_client/views/forms/appointment_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:estiam_doctor_client/views/components/main_drawer.dart';


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
                    new DoctorAppointmentForm()
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