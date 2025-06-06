import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/data/database/hero_database.dart';
import 'package:rickandmorty/data/models/hero_model.dart';

part 'favorite_list_event.dart';
part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final HeroesDatabase database;
  final List<HeroModel> _favorites = [];

  FavoriteListBloc(this.database) : super(FavoriteListInitial()) {
    on<LoadFavoriteList>(_load);
    on<AddFavorite>(_add);
    on<RemoveFavorite>(_remove);
  }

  Future<void> _load(
    LoadFavoriteList event,
    Emitter<FavoriteListState> emit,
  ) async {
    emit(FavoriteListLoading());
    try {
      final favoriteIds = await database.getAllFavoriteIds();
      log('Favorite ids: $favoriteIds');

      final favorites = <HeroModel>[];
      for (final id in favoriteIds) {
        final hero = await database.getHeroById(id);
        if (hero != null) {
          favorites.add(HeroModel.fromDb(hero));
        } else {
          log('Hero with id $id not found in database');
        }
      }
      _favorites.clear();
      _favorites.addAll(favorites);

      emit(FavoriteListLoaded(favorites: List.from(_favorites)));
    } catch (e, st) {
      log('Error loading favorites: $e\n$st');
      emit(FavoriteListFailure());
    }
  }

  Future<void> _add(AddFavorite event, Emitter<FavoriteListState> emit) async {
    try {
      final isAlreadyFavorite = _favorites.any(
        (hero) => hero.id == event.hero.id,
      );
      if (!isAlreadyFavorite) {
        await database.addFavorite(event.hero.id);
        // После добавления в базу загрузим заново список избранных
        final favoriteIds = await database.getAllFavoriteIds();
        final favorites = <HeroModel>[];
        for (final id in favoriteIds) {
          final hero = await database.getHeroById(id);
          if (hero != null) favorites.add(HeroModel.fromDb(hero));
        }
        _favorites
          ..clear()
          ..addAll(favorites);
        emit(FavoriteListLoaded(favorites: List.from(_favorites)));
      }
    } catch (e, st) {
      log('Error adding favorite: $e\n$st');
      emit(FavoriteListFailure());
    }
  }

  Future<void> _remove(
    RemoveFavorite event,
    Emitter<FavoriteListState> emit,
  ) async {
    _favorites.removeWhere((hero) => hero.id == event.hero.id);
    await database.removeFavorite(event.hero.id);
    emit(FavoriteListLoaded(favorites: List.from(_favorites)));
  }
}
