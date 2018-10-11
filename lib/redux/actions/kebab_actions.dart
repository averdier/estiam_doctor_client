
import 'package:estiam_doctor_client/models/kebab.dart';

/// On kebab request
class KebabRequest {
  final String name;

  /// Constructor
  KebabRequest(this.name);
}

/// On kebab request success
class KebabRequestSuccess {
  final Kebab kebab;

  /// Constructor
  KebabRequestSuccess(this.kebab);
}

/// On kebab request failure
class KebabRequestFailure {
  final String error;

  /// Constructor
  KebabRequestFailure(this.error);
}

/// On kebab list request
class KebabListRequest {}

/// On kebab list request success
class KebabListRequestSuccess {
  final List<Kebab> kebabs;

  /// Constructor
  KebabListRequestSuccess(this.kebabs);
}

/// On kebab list request failure
class KebabListRequestFailure {
  final String error;

  /// Constructor
  KebabListRequestFailure(this.error);
}

