import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/data/models/hero_model.dart';

part 'favorite_list_event.dart';
part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final List<HeroModel> _favorites = [];
  FavoriteListBloc() : super(FavoriteListInitial()) {
    on<LoadFavoriteList>(_load);
    on<AddFavorite>(_add);
    on<RemoveFavorite>(_remove);
  }

  void _load(LoadFavoriteList event, Emitter<FavoriteListState> emit) {
    emit(FavoriteListLoading());
    try {
      emit(FavoriteListLoaded(favorites: List.from(_favorites)));
    } catch (_) {
      emit(FavoriteListFailure());
    }
  }

  void _add(AddFavorite event, Emitter<FavoriteListState> emit) {
    if (!_favorites.any((hero) => hero.id == event.hero.id)) {
      _favorites.add(event.hero);
    }
    emit(FavoriteListLoaded(favorites: List.from(_favorites)));
  }

  void _remove(RemoveFavorite event, Emitter<FavoriteListState> emit) {
    _favorites.removeWhere((hero) => hero.id == event.hero.id);
    emit(FavoriteListLoaded(favorites: List.from(_favorites)));
  }
}
