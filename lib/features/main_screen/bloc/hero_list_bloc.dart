import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../domain/models/hero_model.dart';
import '../domain/repositories/hero_repository.dart';
part 'hero_list_event.dart';
part 'hero_list_state.dart';

class HeroListBloc extends Bloc<HeroListEvent, HeroListState> {
  final HeroRepository heroRepository;

  int _currentPage = 1;
  bool _isFetching = false;
  HeroListLoaded? _lastListState;

  HeroListBloc(this.heroRepository) : super(HeroListInitial()) {
    on<LoadHeroList>(_load);
    on<LoadHeroDetails>(_details);
    on<LoadNextPage>(_loadNextPage);
    on<RestoreListState>(_restoreListState);
  }

  Future<void> _load(
    LoadHeroList event,
    Emitter<HeroListState> emit,
  ) async {
    emit(HeroListLoading());
    try {
      _currentPage = 1;
      final heroes = await heroRepository.getHeroesByPage(_currentPage);
      await heroRepository.saveHeroes(heroes);
      final loadedState = HeroListLoaded(heroes: heroes);
      _lastListState = loadedState;
      emit(loadedState);
    } catch (e) {
      emit(HeroListFailure(error: 'error'));
    }
  }

  Future<void> _loadNextPage(
    LoadNextPage event,
    Emitter<HeroListState> emit,
  ) async {
    if (_isFetching) return;
    if (state is! HeroListLoaded) return;

    _isFetching = true;

    final currentState = state as HeroListLoaded;
    try {
      _currentPage++;
      final newHeroes = await heroRepository.getHeroesByPage(_currentPage);
      if (newHeroes.isEmpty) {
        _isFetching = false;
        return;
      }

      await heroRepository.saveHeroes(newHeroes);

      final allHeroes = List<HeroModel>.from(currentState.heroes)
        ..addAll(newHeroes);
      final loadedState = HeroListLoaded(heroes: allHeroes);
      _lastListState = loadedState;
      emit(loadedState);
    } catch (e) {
      emit(HeroListFailure(error: 'error'));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> _details(
    LoadHeroDetails event,
    Emitter<HeroListState> emit,
  ) async {
    if (state is HeroListLoaded) {
      _lastListState = state as HeroListLoaded;
    }
    
    if (state is HeroDetailsLoaded) {
      final currentHero = (state as HeroDetailsLoaded).hero;
      if (currentHero.id == event.id) {
        return;
      }
    }
    
    try {
      final hero = await heroRepository.getHeroById(event.id);
      if (hero != null) {
        emit(HeroDetailsLoaded(hero: hero));
        return;
      }
    } catch (e) {
    }
    
    emit(HeroListLoading());
    try {
      final hero = await heroRepository.getHeroById(event.id);
      if (hero == null) {
        emit(HeroListFailure(error: 'Hero not found'));
        return;
      }
      emit(HeroDetailsLoaded(hero: hero));
    } catch (e) {
      emit(HeroListFailure(error: 'error'));
    }
  }
  
  Future<void> _restoreListState(
    RestoreListState event,
    Emitter<HeroListState> emit,
  ) async {
    if (_lastListState != null) {
      emit(_lastListState!);
    } else {
      add(LoadHeroList());
    }
  }
}
