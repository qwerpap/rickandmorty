import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/data/models/hero_model.dart';
import 'package:rickandmorty/data/repositories/sources/heroes_repository.dart';
part 'hero_list_event.dart';
part 'hero_list_state.dart';

class HeroListBloc extends Bloc<HeroListEvent, HeroListState> {
  final HeroesRepository heroRepository;

  int _currentPage = 1;
  bool _isFetching = false;

  HeroListBloc(this.heroRepository) : super(HeroListInitial()) {
    on<LoadHeroList>(_load);
    on<LoadHeroDetails>(_details);
    on<LoadNextPage>(_loadNextPage);
  }

  Future<void> _load(LoadHeroList event, Emitter<HeroListState> emit) async {
    emit(HeroListLoading());
    try {
      _currentPage = 1;
      final heroes = await heroRepository.getHeroesByPage(_currentPage);
      emit(HeroListLoaded(heroes: heroes));
    } catch (e) {
      print(e);
      emit(HeroListFailure(error: 'error'));
    }
  }

  Future<void> _loadNextPage(
    LoadNextPage event,
    Emitter<HeroListState> emit,
  ) async {
    if (_isFetching) return; // предотвращаем множественные запросы
    if (state is! HeroListLoaded) return;

    _isFetching = true;

    final currentState = state as HeroListLoaded;
    try {
      _currentPage++;
      final newHeroes = await heroRepository.getHeroesByPage(_currentPage);
      if (newHeroes.isEmpty) {
        // Можно добавить флаг, что все данные загружены
        _isFetching = false;
        return;
      }

      final allHeroes = List<HeroModel>.from(currentState.heroes)
        ..addAll(newHeroes);
      emit(HeroListLoaded(heroes: allHeroes));
    } catch (e) {
      print(e);
      emit(HeroListFailure(error: 'error'));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> _details(
    LoadHeroDetails event,
    Emitter<HeroListState> emit,
  ) async {
    emit(HeroListLoading());
    try {
      final hero = await heroRepository.getHeroById(event.id);
      if (hero == null) {
        emit(HeroListFailure(error: 'Hero not found'));
        return;
      }
      emit(HeroDetailsLoaded(hero: hero));
    } catch (e) {
      print(e);
      emit(HeroListFailure(error: 'error'));
    }
  }
}
