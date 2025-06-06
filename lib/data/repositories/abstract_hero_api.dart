import 'package:rickandmorty/data/models/hero_model.dart';

abstract class AbstractHeroApi {
  Future<List<HeroModel>> getHeroData();
  Future<HeroModel> getHeroById(int id);
}
