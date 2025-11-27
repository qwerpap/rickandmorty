abstract class FavoriteRepository {
  Future<void> addFavorite(int heroId);
  Future<void> removeFavorite(int heroId);
  Future<List<int>> getAllFavoriteIds();
  Future<bool> isFavorite(int heroId);
}

