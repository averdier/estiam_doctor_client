import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:estiam_doctor_client/redux/actions/doctor_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:estiam_doctor_client/models/doctor.dart';
import 'package:estiam_doctor_client/views/components/main_drawer.dart';

class DoctorListScreen extends StatelessWidget {

  /// Constructor
  DoctorListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Choisir un docteur')
      ),
      body: new StoreConnector<AppState, _ViewModel>(
          converter: (Store<AppState> store) {
            _ViewModel vm = _ViewModel.fromStore(store);
            return vm;
          },
          builder: (BuildContext context, vm) {
            return _buildDoctorList(context, vm.doctors);
          }
      ),
      drawer: new MainDrawer(),
    );
  }

  /// Create kebabs list
  Widget _buildDoctorList(BuildContext context, List<Doctor> doctors) {
    return Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.white70,
              ])),
        child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, i) {
            return _buildDoctorRow(context, doctors.elementAt(i));
          },
        ),
    );
  }

  /// Create row from kebab
  Widget _buildDoctorRow(BuildContext context, Doctor doctor) {
    return InkWell(
        onTap: () {
          StoreProvider.of<AppState>(context).dispatch(
              new DoctorRequest(doctor.name, doctor.officeName, doctor.phoneNumber, doctor.userId)
          );
          Navigator.of(context).pushNamed('/doctors/details');
        },
        child: Card(
            child: new Container(
              padding: EdgeInsets.all(8.0),
              child: new Row(
                children: <Widget>[
                  CircleAvatar( child: new Text(doctor.name[0]),),
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  Text("Dr. " + doctor.name, style: TextStyle(fontSize: 20.0),),
                ],
              ) ,
            ),
          )
    );

  }
}

class _ViewModel {
  final List<Doctor> doctors;

  /// Constructor
  _ViewModel({
    @required this.doctors
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(doctors: store.state.doctor.doctors);
  }
}