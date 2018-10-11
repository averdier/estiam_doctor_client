import 'package:meta/meta.dart';
import 'package:estiam_doctor_client/models/kebab.dart';


@immutable
class KebabState {

  final List<Kebab> kebabs;
  final Kebab selectedKebab;
  final String error;

  /// Constructor
  KebabState({
    this.kebabs,
    this.selectedKebab,
    this.error
  });

  KebabState copyWith({
    List<Kebab> kebabs,
    Kebab selectedKebab,
    String error
  }) {
    return new KebabState(
      kebabs: kebabs ?? this.kebabs,
      selectedKebab: selectedKebab ?? this.selectedKebab,
      error: error ?? this.error
    );
  }

  factory KebabState.fromJSON(Map<String, dynamic> json) => new KebabState(
    kebabs: (json['kebabs'] as List).map((i) => new Kebab.fromJSON(i)).toList(),
    selectedKebab: json['selectedKebab'] != null ? Kebab.fromJSON(json['selectedKebab']) : null,
    error: json['error']
  );

  Map<String, dynamic> toJSON() => <String, dynamic>{
    'kebabs': this.kebabs.map((kebab) {
      return kebab.toJSON();
    }).toList(),
    'selectedKebab': this.selectedKebab != null ? this.selectedKebab.toJSON() : null,
    'error': this.error
  };

  @override
  String toString() {
    return '''{
                kebabs: $kebabs,
                selectedKebab: $selectedKebab,
                error: $error
            }''';
  }
}