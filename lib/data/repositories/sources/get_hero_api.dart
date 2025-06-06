import 'package:dio/dio.dart';
import 'package:rickandmorty/data/models/hero_model.dart';
import 'package:rickandmorty/data/repositories/abstract_hero_api.dart';

class GetHeroApi implements AbstractHeroApi {
  GetHeroApi({required this.dio});
  final Dio dio;

  @override
  Future<List<HeroModel>> getHeroData() async {
    final response = await dio.get('https://rickandmortyapi.com/api/character');
    final data = response.data;
    final results = data['results'] as List<dynamic>;

    final List<HeroModel> heroes =
        results.map((e) => HeroModel.fromJson(e)).toList();
    return heroes;
  }

  @override
  Future<HeroModel> getHeroById(int id) async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character/$id',
    );
    final data = response.data;
    return HeroModel.fromJson(data);
  }

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
