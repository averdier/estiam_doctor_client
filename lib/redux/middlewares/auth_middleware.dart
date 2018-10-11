import 'package:flutter/material.dart';
import 'package:estiam_doctor_client/models/user.dart';
import 'package:estiam_doctor_client/redux/actions/auth_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


/// Create and return auth middleware
List<Middleware<AppState>> createAuthMiddleware() => <Middleware<AppState>>[
  new TypedMiddleware<AppState, UserLoginRequest>(logIn),
];

final logIn = _login();

/// Login user
Middleware<AppState> _login() {
  return (Store store, action, NextDispatcher next) async {

    FirebaseUser user;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignIn _googleSignIn = new GoogleSignIn();

    if (action is UserLoginRequest) {
      try {

        GoogleSignInAccount googleUser = await _googleSignIn.signIn();
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;


        user = await _auth.signInWithGoogle(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        User finalUser = new User(user.displayName,user.uid,user.phoneNumber);
        store.dispatch(new UserLoginSuccess(finalUser));

        Navigator.of(action.context)
            .pushNamedAndRemoveUntil('/main', (_) => false);
      } catch (error) {
        store.dispatch(new UserLoginFailure(error));
      }
    }
  };
}