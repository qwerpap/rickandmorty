import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/data/models/hero_model.dart';
import 'package:rickandmorty/data/repositories/abstract_hero_api.dart';
part 'hero_list_event.dart';
part 'hero_list_state.dart';

class HeroListBloc extends Bloc<HeroListEvent, HeroListState> {
  final AbstractHeroApi heroRepository;
  HeroListBloc(this.heroRepository) : super(HeroListInitial()) {
    on<LoadHeroList>(_load);
  }
  void _load(LoadHeroList event, Emitter<HeroListState> emit) async {
    emit(HeroListLoading());
    try {
      final heroes = await heroRepository.getHeroData();
      emit(HeroListLoaded(heroes: heroes));
    } catch (e) {
      print(e);
      emit(HeroListFailure(error: 'error'));
    }
  }
}
