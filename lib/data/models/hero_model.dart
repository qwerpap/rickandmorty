class HeroModel {
  final int id;
  final String image;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String url;

  HeroModel({
    required this.id,
    required this.image,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.url,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: json['id'] as int,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'url': url,
    };
  }
}
