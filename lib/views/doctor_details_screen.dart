import 'package:flutter/material.dart';
import 'package:estiam_doctor_client/views/components/main_drawer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';


class DoctorDetailsScreen extends StatelessWidget {

  /// Constructor
  DoctorDetailsScreen({Key key}) : super(key : key);

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
            return new Column(
              children: <Widget>[
                new Text(vm.name),
                new Text(vm.phoneNumber),
                new Text(vm.officeName),
                new Text(vm.userId),
                new MaterialButton(
                    onPressed: () {
                      print('Asked for a date with : ' + vm.name);
                    },
                )
              ],
            );
          }
      ),
      drawer: new MainDrawer(),
    );
  }
}

class _ViewModel {
  final String name;
  final String officeName;
  final String phoneNumber;
  final String userId;

  /// Constructor
  _ViewModel({
    @required this.name,
    @required this.officeName,
    @required this.phoneNumber,
    @required this.userId
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      name: store.state.doctor.selectedDoctor.name,
      officeName: store.state.doctor.selectedDoctor.officeName,
      phoneNumber: store.state.doctor.selectedDoctor.phoneNumber,
      userId: store.state.doctor.selectedDoctor.userId
    );
  }
}