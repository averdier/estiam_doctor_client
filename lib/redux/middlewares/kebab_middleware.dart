import 'package:estiam_doctor_client/models/kebab.dart';
import 'package:estiam_doctor_client/redux/actions/kebab_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createKebabMiddleware() => <Middleware<AppState>>[
  new TypedMiddleware<AppState, KebabListRequest>(getKebabs),
  new TypedMiddleware<AppState, KebabRequest>(getKebab)
];

final getKebabs = _getKebabs();
final getKebab = _getKebab();

/// Get kebabs
Middleware<AppState> _getKebabs() {
  return (Store store, action, NextDispatcher next) async {
    if (action is KebabListRequest) {
      store.dispatch(KebabListRequestSuccess([
        new Kebab('Kebab 01', 'Loreum ipsum', 7.0, 'https://via.placeholder.com/600x800', 'https://via.placeholder.com/1920x1080'),
        new Kebab('Kebab 02', 'Loreum ipsum', 10.0,'https://via.placeholder.com/600x800', 'https://via.placeholder.com/1920x1080')
      ]));
    }
  };
}

/// Get kebab
Middleware<AppState> _getKebab() {
  return (Store store, action, NextDispatcher next) async {
    if (action is KebabRequest) {
      store.dispatch(KebabRequestSuccess(new Kebab(action.name, 'Loreum ipsum', 10.0, 'https://via.placeholder.com/600x800', 'https://via.placeholder.com/1920x1080')));
    }
  };
}