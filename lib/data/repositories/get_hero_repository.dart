import 'package:dio/dio.dart';
import 'package:rickandmorty/data/models/hero_model.dart';

class GetHeroRepository {
  Future<List<HeroModel>> heroRepository() async {
    final Dio dio = Dio();
    final response = await dio.get('https://rickandmortyapi.com/api/character');
    final data = response.data;
    final results = data['results'] as List<dynamic>;

    final List<HeroModel> heroes =
        results.map((e) => HeroModel.fromJson(e)).toList();
    print(heroes);
    return heroes;
  }
}
