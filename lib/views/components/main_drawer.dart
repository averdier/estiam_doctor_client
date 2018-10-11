import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:estiam_doctor_client/redux/actions/auth_actions.dart';
import 'package:estiam_doctor_client/redux/actions/doctor_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:estiam_doctor_client/styles/colors.dart';


class MainDrawer extends StatelessWidget {

  /// Constructor
  MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[

          /// Header
          new Container(
            height: 120.0,
            child: new DrawerHeader(
              padding: new EdgeInsets.all(0.0),
              decoration: new BoxDecoration(
                color: new Color(0xFFECEFF1)
              ),
              child: new Center(
                child: new FlutterLogo(
                  colors: colorStyles['primary'],
                  size:54.0
                )
              )
            ),
          ),

          /// Home section
          new ListTile(
              leading: new Icon(Icons.home),
              title: new Text('Home'),
              onTap: () {
                print('You pressed Home');
                Navigator.of(context).pushReplacementNamed('/main');
              }
          ),

          /// Doctors section
          new ListTile(
            leading: new Icon(Icons.shopping_basket),
            title: new Text('Doctors'),
            onTap: () {
              print('You pressed Doctors');
              StoreProvider.of<AppState>(context).dispatch(
                  new DoctorListRequest()
              );
              Navigator.of(context).pushReplacementNamed('/doctors');
            }
          ),

          /// Commands section
          new ListTile(
              leading: new Icon(Icons.library_books),
              title: new Text('Commands'),
              onTap: () {
                print('You pressed Commands');
                Navigator.of(context).pushReplacementNamed('/commands');
              }
          ),

          /// Logout
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.exit_to_app),
            title: new Text('Sign out'),
            onTap: () {
              StoreProvider.of<AppState>(context).dispatch(
                new UserLogout(context)
              );
              Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => false);
            },
          )
        ],
      )
    );
  }
}
