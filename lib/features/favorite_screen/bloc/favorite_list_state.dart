part of 'favorite_list_bloc.dart';

@immutable
sealed class FavoriteListState {}

final class FavoriteListInitial extends FavoriteListState {}

class FavoriteListLoading extends FavoriteListState {}

class FavoriteListLoaded extends FavoriteListState {
  final List<HeroModel> favorites;

  FavoriteListLoaded({required this.favorites});
}

class FavoriteListFailure extends FavoriteListState {}
