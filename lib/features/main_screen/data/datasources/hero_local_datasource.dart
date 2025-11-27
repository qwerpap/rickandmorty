import 'package:drift/drift.dart';
import '../database/hero_database.dart';
import '../../domain/models/hero_model.dart';

abstract class HeroLocalDataSource {
  Future<void> saveHeroes(List<HeroModel> heroes);
  Future<List<HeroModel>> getAllHeroes();
  Future<HeroModel?> getHeroById(int id);
  Future<void> clearHeroes();
}

class HeroLocalDataSourceImpl implements HeroLocalDataSource {
  final HeroesDatabase db;

  HeroLocalDataSourceImpl({required this.db});

  @override
  Future<void> saveHeroes(List<HeroModel> heroes) async {
    final companions = heroes
        .map(
          (hero) => HeroItemsCompanion(
            id: Value(hero.id),
            image: Value(hero.image),
            name: Value(hero.name),
            status: Value(hero.status),
            species: Value(hero.species),
            gender: Value(hero.gender),
            url: Value(hero.url),
          ),
        )
        .toList();

    await db.insertHeroes(companions);
  }

  @override
  Future<List<HeroModel>> getAllHeroes() async {
    final items = await db.getAllHeroes();
    return items.map((e) => HeroModel.fromDb(e)).toList();
  }

  @override
  Future<HeroModel?> getHeroById(int id) async {
    final hero = await db.getHeroById(id);
    if (hero == null) return null;
    return HeroModel.fromDb(hero);
  }

  @override
  Future<void> clearHeroes() async {
    await db.clearHeroes();
  }
}

