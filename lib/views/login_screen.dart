import 'package:estiam_doctor_client/views/auth_button_container.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  
  /// Constructor
  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: pageSize.width,
            height: pageSize.height,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 1.0],
                colors: [
                  Colors.blue,
                  Colors.white70,
                ],
              ),
            ),
            child: Container(
              height: 400.0,
              child: Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new Image.network('https://sstrndashboard.azurewebsites.net/assets/pictures/logo.png')
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 118.0),
                    child: GoogleAuthButtonContainer(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}