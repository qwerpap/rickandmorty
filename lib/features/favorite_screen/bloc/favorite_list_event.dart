part of 'favorite_list_bloc.dart';

@immutable
sealed class FavoriteListEvent {}

class LoadFavoriteList extends FavoriteListEvent {}

class AddFavorite extends FavoriteListEvent {
  final HeroModel hero;

  AddFavorite({required this.hero});
}

class RemoveFavorite extends FavoriteListEvent {
  final HeroModel hero;

  RemoveFavorite({required this.hero});
}

class SortFavoriteList extends FavoriteListEvent {
  final FavoriteSortOption option;

  SortFavoriteList({required this.option});
}
