import 'package:dio/dio.dart';
import 'package:rickandmorty/data/database/hero_database.dart';
import 'package:rickandmorty/data/models/hero_model.dart';
import 'package:rickandmorty/data/repositories/sources/heroes_local_data_source.dart';
import 'package:rickandmorty/data/repositories/abstract_hero_api.dart';
import 'package:rickandmorty/data/repositories/sources/get_hero_api.dart';

class HeroesRepository {
  final Dio dio;
  final HeroesLocalDataSource localDataSource;
  final AbstractHeroApi remoteApi;

  HeroesRepository({required this.dio, required HeroesDatabase db})
    : localDataSource = HeroesLocalDataSource(db),
      remoteApi = GetHeroApi(dio: dio);

  Future<List<HeroModel>> getAllHeroes() async {
    List<HeroModel> heroes = [];

    try {
      heroes = await remoteApi.getHeroData();
      await localDataSource.saveHeroesToDb(heroes);
    } catch (e) {
      heroes = await localDataSource.getAllHeroesFromDb();
      if (heroes.isEmpty) throw Exception('Нет героев в БД');
    }

    return heroes;
  }

  Future<HeroModel?> getHeroById(int id) async {
    final local = await localDataSource.getHeroByIdFromDb(id);
    if (local != null) return local;

    try {
      final remote = await remoteApi.getHeroById(id);
      await localDataSource.saveHeroesToDb([remote]);
      return remote;
    } catch (_) {
      return null;
    }
  }

  Future<List<HeroModel>> getHeroesByPage(int page) async {
    List<HeroModel> heroes = [];

    try {
      heroes = await remoteApi.getHeroesByPage(page);
      if (page == 1) {
        await localDataSource.saveHeroesToDb(heroes);
      }
    } catch (e) {
      heroes = await localDataSource.getAllHeroesFromDb();
    }

    return heroes;
  }
}
