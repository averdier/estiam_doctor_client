/// Represent user of app
class User {
  final String token;
  final String id;

  /// Constructor
  User(this.token, this.id);

  /// Return user in JSON
  Map<String, dynamic> toJSON() => <String, dynamic>{
    'token': this.token,
    'id': this.id
  };

  /// Create user from JSON
  factory User.fromJSON(Map<String, dynamic> json) => new User(
    json['token'],
    json['id'],
  );

  @override
  String toString() {
    return '{token: $token, id: $id}';
  }
}