import 'package:flutter/material.dart';
import 'package:estiam_doctor_client/models/user.dart';
import 'package:estiam_doctor_client/redux/actions/auth_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';


/// Create and return auth middleware
List<Middleware<AppState>> createAuthMiddleware() => <Middleware<AppState>>[
  new TypedMiddleware<AppState, UserLoginRequest>(logIn),
];

final logIn = _login();

/// Login user
Middleware<AppState> _login() {
  return (Store store, action, NextDispatcher next) async {

    if (action is UserLoginRequest) {

      if (action.username == 'asd' && action.password == 'asd') {

        store.dispatch(new UserLoginSuccess(
            new User('placeholder_token', 'placeholder_id')));

        Navigator.of(action.context)
            .pushNamedAndRemoveUntil('/main', (_) => false);
      } else {
        store.dispatch(
            new UserLoginFailure('Username or password were incorrect.'));
      }
    }

    next(action);
  };
}