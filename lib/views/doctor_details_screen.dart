import 'package:flutter/material.dart';
import 'package:estiam_doctor_client/views/components/main_drawer.dart';
import 'package:estiam_doctor_client/views/doctor_appointment_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';

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

class DoctorDetailsScreen extends StatelessWidget {

  /// Constructor
  DoctorDetailsScreen({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Informations du médecin'),
      ),
      body: new StoreConnector<AppState, _ViewModel>(
          converter: (Store<AppState> store) {
            _ViewModel vm = _ViewModel.fromStore(store);
            return vm;
          },
          builder: (BuildContext context, vm) {
            return new SingleChildScrollView(
              child: new Container(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(
                                          "http://img.over-blog-kiwi.com/610x405-ct/1/54/97/53/20150507/ob_416774_metier-medecin.jpg")
                                  )
                              )
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text("Dr. " + vm.name, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text("Numéro de téléphone", style: new TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(vm.phoneNumber),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(vm.officeName, style: new TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text("12 Rue de Cannes 59000 Lille"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text("Présentation du professionnel de santé", style: new TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text("Quam ob rem circumspecta cautela observatum est deinceps et cum edita montium petere coeperint grassatores, loci iniquitati milites cedunt. ubi autem in planitie potuerint reperiri, quod contingit adsidue, nec exsertare lacertos nec crispare permissi tela, quae vehunt bina vel terna, pecudum ritu inertium trucidantur."),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: RaisedButton(
                                    child: new Text('Prendre rendez-vous'),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DoctorAppointmentScreen()),
                                      );
                                    }
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
      drawer: new MainDrawer(),
    );
  }
}