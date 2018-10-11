import 'package:meta/meta.dart';
import 'package:estiam_doctor_client/models/user.dart';

@immutable
class AuthState {

  final bool isAuthenticated;
  final bool isAuthenticating;
  final User user;
  final String error;

  /// Constructor
  AuthState({
    this.isAuthenticated = false,
    this.isAuthenticating = false,
    this.user,
    this.error,
  });

  /// Return copy of current state
  AuthState copyWith({
    bool isAuthenticated,
    bool isAuthenticating,
    String error,
    User user
  }) {
    return new AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  /// Create state from JSON
  factory AuthState.fromJSON(Map<String, dynamic> json) => new AuthState(
    isAuthenticated: json['isAuthenticated'],
    isAuthenticating: json['isAuthenticating'],
    error: json['error'],
    user: json['user'] == null ? null : new User.fromJSON(json['user']),
  );

  /// Return current state in JSON
  Map<String, dynamic> toJSON() => <String, dynamic>{
    'isAuthenticated': this.isAuthenticated,
    'isAuthenticating': this.isAuthenticating,
    'user': this.user == null ? null : this.user.toJSON(),
    'error': this.error,
  };

  @override
  String toString() {
    return '''{
                isAuthenticated: $isAuthenticated,
                isAuthenticating: $isAuthenticating,
                user: $user,
                error: $error
            }''';
  }
}