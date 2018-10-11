import 'package:meta/meta.dart';
import 'package:estiam_doctor_client/models/kebab.dart';
import 'package:estiam_doctor_client/redux/models/auth_state.dart';
import 'package:estiam_doctor_client/redux/models/kebab_state.dart';

@immutable
class AppState {
  final AuthState auth;
  final KebabState kebab;

  /// Constructor
  AppState({AuthState auth, KebabState kebab}):
        auth = auth ?? new AuthState(),
        kebab = kebab ?? new KebabState(kebabs: new List<Kebab>());

  static AppState rehydrationJSON(dynamic json) => new AppState(
      auth: new AuthState.fromJSON(json['auth']),
      kebab: new KebabState.fromJSON(json['kebab'])
  );

  /// Return current state in JSON
  Map<String, dynamic> toJson() => {
    'auth': auth.toJSON(),
    'kebab': kebab.toJSON()
  };

  /// Return copy of state
  AppState copyWith({
    bool rehydrated,
    AuthState auth,
    KebabState kebab,
  }) {
    return new AppState(
        auth: auth ?? this.auth,
        kebab: kebab ?? this.kebab
    );
  }

  @override
  String toString() {
    return '''AppState{
            auth: $auth,
            kebab: $kebab
        }''';
  }
}