class StoreModels {
  final int id;
  final String name;
  final String phone;
  final String photo;
  final String description;
  final String location;

  StoreModels({
    required this.description,
    required this.photo,
    required this.id,
    required this.name,
    required this.phone,
    required this.location,
  });

  factory StoreModels.fromJson(Map<String, dynamic> json) {
    return StoreModels(
      description: json['description'],
      photo: json['store_picture'],
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      location: json['location'],
    );
  }
}
