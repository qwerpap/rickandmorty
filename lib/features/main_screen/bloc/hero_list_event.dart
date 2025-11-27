part of 'hero_list_bloc.dart';

@immutable
sealed class HeroListEvent {}

class LoadHeroList extends HeroListEvent {}

class LoadHeroDetails extends HeroListEvent {
  final int id;

  LoadHeroDetails({required this.id});
}

class LoadNextPage extends HeroListEvent {}

class RestoreListState extends HeroListEvent {}
