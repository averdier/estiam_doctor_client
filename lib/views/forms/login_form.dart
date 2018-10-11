/*
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:estiam_doctor_client/redux/actions/auth_actions.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => new _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = new GlobalKey<FormState>();

  String _username;
  String _password;

  /// Submit form
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

          /// Username
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Username'),
              validator: (val) =>
                val.isEmpty ? 'Please enter your username.' : null,
              onSaved: (val) => _username = val
          ),

          /// Password
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Password'),
              validator: (val) =>
                val.isEmpty ? 'Please enter your password.' : null,
              onSaved: (val) => _password = val,
              obscureText: true,
          ),


          /// Submit button
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
            child: new IconButton(
                icon: new Icon(Icons.done),
                onPressed: () {
                  _submit();
                  StoreProvider.of<AppState>(context).dispatch(
                    new UserLoginRequest(context, _username, _password)
                  );
                }
            )
          )
        ],
      )
    );
  }
}*/
