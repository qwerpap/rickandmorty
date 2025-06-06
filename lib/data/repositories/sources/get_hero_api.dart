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
    print(heroes);
    return heroes;
  }
}
