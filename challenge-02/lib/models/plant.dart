class Plant {
  String id;
  String name;
  String image;
  String description;
  double price;
  String carelevel;
  String country;

  Plant({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.carelevel,
    required this.country,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      price: double.parse(json['price'] as String),
      carelevel: json['carelevel'] as String,
      country: json['country'] as String,
    );
  }
}
