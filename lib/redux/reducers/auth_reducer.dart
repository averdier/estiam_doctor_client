import 'package:estiam_doctor_client/redux/actions/auth_actions.dart';
import 'package:estiam_doctor_client/redux/models/auth_state.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers([
  new TypedReducer<AuthState, UserLoginSuccess>(userLoginSuccessReducer),
  new TypedReducer<AuthState, UserLoginFailure>(userLoginFailureReducer),
  new TypedReducer<AuthState, UserLogout>(userLogoutReducer)
]);

/// On user login success, save logged in state
AuthState userLoginSuccessReducer(AuthState auth, UserLoginSuccess action) {
  return auth.copyWith(
    isAuthenticated: true,
    isAuthenticating: false,
    user: action.user
  );
}

/// On user login failed, save error in state
AuthState userLoginFailureReducer(AuthState state, UserLoginFailure action) {
  return state.copyWith(
    isAuthenticated: false,
    isAuthenticating: false,
    error: action.error
  );
}

/// On user logout, clean state
AuthState userLogoutReducer(AuthState state, UserLogout action) {
  return new AuthState();
}