import '../database/favorite_database.dart';

abstract class FavoriteLocalDataSource {
  Future<void> addFavorite(int heroId);
  Future<void> removeFavorite(int heroId);
  Future<List<int>> getAllFavoriteIds();
  Future<bool> isFavorite(int heroId);
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final FavoriteDatabase db;

  FavoriteLocalDataSourceImpl({required this.db});

  @override
  Future<void> addFavorite(int heroId) async {
    await db.addFavorite(heroId);
  }

  @override
  Future<void> removeFavorite(int heroId) async {
    await db.removeFavorite(heroId);
  }

  @override
  Future<List<int>> getAllFavoriteIds() async {
    return await db.getAllFavoriteIds();
  }

  @override
  Future<bool> isFavorite(int heroId) async {
    return await db.isFavorite(heroId);
  }
}

