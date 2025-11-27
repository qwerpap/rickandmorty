import '../../domain/repositories/favorite_repository.dart';
import '../datasources/favorite_local_datasource.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addFavorite(int heroId) async {
    await localDataSource.addFavorite(heroId);
  }

  @override
  Future<void> removeFavorite(int heroId) async {
    await localDataSource.removeFavorite(heroId);
  }

  @override
  Future<List<int>> getAllFavoriteIds() async {
    return await localDataSource.getAllFavoriteIds();
  }

  @override
  Future<bool> isFavorite(int heroId) async {
    return await localDataSource.isFavorite(heroId);
  }
}

