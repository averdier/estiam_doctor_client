/// Represent user of app
class User {
  final String name;
  final String id;
  final String phone;

  /// Constructor
  User(this.name, this.id, this.phone);

  /// Return user in JSON
  Map<String, dynamic> toJSON() => <String, dynamic>{
    'name': this.name,
    'id': this.id,
    'phone': this.phone,
  };

  /// Create user from JSON
  factory User.fromJSON(Map<String, dynamic> json) => new User(
    json['name'],
    json['id'],
    json['phone'],
  );

  @override
  String toString() {
    return '{name: $name, id: $id, phone: $phone}';
  }
}