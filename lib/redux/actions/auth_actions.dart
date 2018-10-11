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
class UserLogout {
  final BuildContext context;

  UserLogout(this.context);
}

class LogOutSuccessful {
  LogOutSuccessful();
  @override
  String toString() {
    return 'LogOut{user: null}';
  }
}

class LogOutFail {
  final dynamic error;
  LogOutFail(this.error);
  String toString() {
    return '{There was an error logging out: $error}';
  }
}