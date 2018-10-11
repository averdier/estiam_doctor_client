import 'package:estiam_doctor_client/redux/actions/kebab_actions.dart';
import 'package:estiam_doctor_client/redux/models/kebab_state.dart';
import 'package:redux/redux.dart';


Reducer<KebabState> kebabReducer = combineReducers([
  new TypedReducer<KebabState, KebabListRequestSuccess>(getKebabListSuccessReducer),
  new TypedReducer<KebabState, KebabListRequestFailure>(getKebabListFailureReducer),
  new TypedReducer<KebabState, KebabRequestSuccess>(getKebabRequestSuccessReducer),
  new TypedReducer<KebabState, KebabRequestFailure>(getKebabRequestFailureReducer),
]);


KebabState getKebabListSuccessReducer(KebabState state, KebabListRequestSuccess action) {
  return state.copyWith(
    kebabs: action.kebabs,
    selectedKebab: null,
  );
}

KebabState getKebabListFailureReducer(KebabState state, KebabListRequestFailure action) {
  return state.copyWith(
    error: action.error
  );
}

KebabState getKebabRequestSuccessReducer(KebabState state, KebabRequestSuccess action) {
  return state.copyWith(
    selectedKebab: action.kebab
  );
}

KebabState getKebabRequestFailureReducer(KebabState state, KebabRequestFailure action) {
  return state.copyWith(
    selectedKebab: null,
    error: action.error
  );
}