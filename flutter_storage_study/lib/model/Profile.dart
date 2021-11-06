class Profile {
  int? id;
  String name;
  String address;

  Profile({this.id, required this.name, required this.address});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        id: json['id'] as int?,
        name: json['name'] as String,
        address: json['address'] as String);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'address': address};
}
