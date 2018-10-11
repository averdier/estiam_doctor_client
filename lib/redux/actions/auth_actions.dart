import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:estiam_doctor_client/models/user.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';

/// On login request
class UserLoginRequest {

  final BuildContext context;
  /// Constructor
  UserLoginRequest(this.context);
}

/// On login success
class UserLoginSuccess {
  final User user;

  /// Constructor
  UserLoginSuccess(this.user);
}

/// On login error
class UserLoginFailure {
  final String error;

  /// Constructor
  UserLoginFailure(this.error);
}

/// On user logout
class UserLogout {}

/// Logout user and go to login
final Function logout = (BuildContext context) {
  return (Store<AppState> store) {
    store.dispatch(new UserLogout());
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => false);
  };
};