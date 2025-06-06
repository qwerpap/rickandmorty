part of 'hero_list_bloc.dart';

@immutable
sealed class HeroListEvent {}

class LoadHeroList extends HeroListEvent {}
