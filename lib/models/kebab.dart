class Kebab {
  final String name;
  final String description;
  final num price;
  final String imageUrl;
  final String bannerUrl;

  /// Constructor
  Kebab(this.name, this.description, this.price, this.imageUrl, this.bannerUrl);

  /// Get kebab in JSON
  Map<String, dynamic> toJSON() => <String, dynamic> {
    'name': this.name,
    'description': this.description,
    'price': this.price,
    'imageUrl': this.imageUrl,
    'bannerUrl': this.bannerUrl
  };

  /// Create kebab from JSON
  factory Kebab.fromJSON(Map<String, dynamic> json) => new Kebab(
      json['name'], json['description'], json['price'], json['imageUrl'], json['bannerUrl']
  );

  @override
  String toString() {
    return '{name: $name, description: $description, price: $price, imageUrl: $imageUrl}';
  }
}