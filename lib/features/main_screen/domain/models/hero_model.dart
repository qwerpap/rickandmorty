import 'package:equatable/equatable.dart';
import '../../data/database/hero_database.dart';

class HeroModel extends Equatable {
  final int id;
  final String image;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String url;

  const HeroModel({
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

  factory HeroModel.fromDb(HeroItem heroItem) {
    return HeroModel(
      id: heroItem.id,
      image: heroItem.image,
      name: heroItem.name,
      status: heroItem.status,
      species: heroItem.species,
      gender: heroItem.gender,
      url: heroItem.url,
    );
  }

  @override
  List<Object> get props => [id, image, name, status, species, gender, url];
}

