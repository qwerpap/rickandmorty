import '../models/hero_model.dart';

abstract class HeroRepository {
  Future<List<HeroModel>> getAllHeroes();
  Future<HeroModel?> getHeroById(int id);
  Future<List<HeroModel>> getHeroesByPage(int page);
  Future<void> saveHeroes(List<HeroModel> heroes);
}

