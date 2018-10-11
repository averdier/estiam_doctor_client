import 'package:estiam_doctor_client/redux/actions/auth_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:estiam_doctor_client/views/components/google_auth_button.dart';
import 'package:estiam_doctor_client/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class GoogleAuthButtonContainer extends StatelessWidget {
  GoogleAuthButtonContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return new GoogleAuthButton(
          buttonText: vm.buttonText,
          onPressedCallback: () => vm.onPressedCallback(context),
        );
      },
    );
  }
}

class _ViewModel {
  final String buttonText;
  final Function onPressedCallback;

  _ViewModel({this.onPressedCallback, this.buttonText});

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      buttonText: store.state.auth.user != null ? 'Déconnexion' : 'Connexion avec Google',
      onPressedCallback: (context) {
        if (store.state.auth.user != null) {
          /*store.dispatch(new LogOut());*/
          var route = new MaterialPageRoute(
              settings: new RouteSettings(name: '/login'),
              builder: (context) => new LoginScreen());
          Navigator
              .of(context)
              .pushAndRemoveUntil(route, ModalRoute.withName('/'));
        } else {
          store.dispatch(new UserLoginRequest(context));
          Navigator.of(context).pushNamed('/loading');
        }
      },
    );
  }
}