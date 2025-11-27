import 'package:dio/dio.dart';
import '../../domain/models/hero_model.dart';

abstract class HeroRemoteDataSource {
  Future<List<HeroModel>> getHeroes();
  Future<HeroModel> getHeroById(int id);
  Future<List<HeroModel>> getHeroesByPage(int page);
}

class HeroRemoteDataSourceImpl implements HeroRemoteDataSource {
  final Dio dio;

  HeroRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<HeroModel>> getHeroes() async {
    final response = await dio.get('https://rickandmortyapi.com/api/character');
    final data = response.data;
    final results = data['results'] as List<dynamic>;

    return results.map((e) => HeroModel.fromJson(e)).toList();
  }

  @override
  Future<HeroModel> getHeroById(int id) async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character/$id',
    );
    final data = response.data;
    return HeroModel.fromJson(data);
  }

  @override
  Future<List<HeroModel>> getHeroesByPage(int page) async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character',
      queryParameters: {'page': page},
    );

    final data = response.data;
    final results = data['results'] as List<dynamic>;
    return results.map((e) => HeroModel.fromJson(e)).toList();
  }
}

