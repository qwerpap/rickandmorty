import 'dart:developer' as developer;
import 'package:drift/drift.dart';
import 'package:rickandmorty/data/database/hero_database.dart';
import 'package:rickandmorty/data/models/hero_model.dart';

class HeroesLocalDataSource {
  final HeroesDatabase db;

  HeroesLocalDataSource(this.db);

  Future<void> saveHeroesToDb(List<HeroModel> heroes) async {
    await db.clearHeroes();

    final companions =
        heroes
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
    developer.log('Сохранено героев: ${heroes.length}', name: 'DB');
  }

  Future<List<HeroModel>> getAllHeroesFromDb() async {
    final items = await db.getAllHeroes();
    return items
        .map(
          (e) => HeroModel(
            id: e.id,
            image: e.image,
            name: e.name,
            status: e.status,
            species: e.species,
            gender: e.gender,
            url: e.url,
          ),
        )
        .toList();
  }

  Future<HeroModel?> getHeroByIdFromDb(int id) async {
    final hero = await db.getHeroById(id);
    if (hero == null) return null;

    return HeroModel(
      id: hero.id,
      image: hero.image,
      name: hero.name,
      status: hero.status,
      species: hero.species,
      gender: hero.gender,
      url: hero.url,
    );
  }

  Future<void> clearHeroesDb() async {
    await db.clearHeroes();
    developer.log('Очищена база героев', name: 'DB');
  }
}
