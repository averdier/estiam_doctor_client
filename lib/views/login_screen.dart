import 'package:flutter/material.dart';
import 'package:estiam_doctor_client/styles/colors.dart';
import 'package:estiam_doctor_client/views/forms/login_form.dart';


class LoginScreen extends StatelessWidget {
  
  /// Constructor
  LoginScreen({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Padding(
          padding: new EdgeInsets.fromLTRB(32.0, MediaQuery.of(context).padding.top + 32.0, 32.0, 32.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  child: new Center(
                    child: new FlutterLogo(
                      colors: colorStyles['primary'],
                      size: 200.0
                    )
                  )
              ),
              new LoginForm()
            ],
          )
        )
      ),
    );
  }
}