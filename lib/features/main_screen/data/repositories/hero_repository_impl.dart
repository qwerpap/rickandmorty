import '../../domain/models/hero_model.dart';
import '../../domain/repositories/hero_repository.dart';
import '../datasources/hero_local_datasource.dart';
import '../datasources/hero_remote_datasource.dart';

class HeroRepositoryImpl implements HeroRepository {
  final HeroRemoteDataSource remoteDataSource;
  final HeroLocalDataSource localDataSource;

  HeroRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<HeroModel>> getAllHeroes() async {
    try {
      final heroes = await remoteDataSource.getHeroes();
      await localDataSource.saveHeroes(heroes);
      return heroes;
    } catch (e) {
      final heroes = await localDataSource.getAllHeroes();
      if (heroes.isEmpty) {
        throw Exception('Нет героев в БД');
      }
      return heroes;
    }
  }

  @override
  Future<HeroModel?> getHeroById(int id) async {
    final local = await localDataSource.getHeroById(id);
    if (local != null) return local;

    try {
      final remote = await remoteDataSource.getHeroById(id);
      await localDataSource.saveHeroes([remote]);
      return remote;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<HeroModel>> getHeroesByPage(int page) async {
    try {
      final heroes = await remoteDataSource.getHeroesByPage(page);
      await localDataSource.saveHeroes(heroes);
      return heroes;
    } catch (e) {
      return await localDataSource.getAllHeroes();
    }
  }

  @override
  Future<void> saveHeroes(List<HeroModel> heroes) async {
    await localDataSource.saveHeroes(heroes);
  }
}

