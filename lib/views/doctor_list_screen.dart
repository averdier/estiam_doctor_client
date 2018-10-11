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
        title: new Text('FindADoc')
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
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, i) {
        return _buildDoctorRow(context, doctors.elementAt(i));
      },
    );
  }
  
  /// Create row from kebab
  Widget _buildDoctorRow(BuildContext context, Doctor doctor) {
    return ListTile(
      title: new Text(doctor.name),
      subtitle: new Text(doctor.officeName.toString()),
      onTap: () {
        print(doctor.toString() + ' tapped');
        StoreProvider.of<AppState>(context).dispatch(
          new DoctorRequest(doctor.name, doctor.officeName, doctor.phoneNumber, doctor.userId)
        );
        Navigator.of(context).pushNamed('/doctors/details');
      }
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
