part of 'hero_list_bloc.dart';

@immutable
sealed class HeroListState {}

final class HeroListInitial extends HeroListState {}

final class HeroListLoading extends HeroListState {}

final class HeroListLoaded extends HeroListState {
  final List<HeroModel> heroes;

  HeroListLoaded({required this.heroes});
}

final class HeroDetailsLoaded extends HeroListState {
  final HeroModel hero;

  HeroDetailsLoaded({required this.hero});
}

final class HeroListFailure extends HeroListState {
  final String error;

  HeroListFailure({required this.error});
}
