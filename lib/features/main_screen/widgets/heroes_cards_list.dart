import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/data/models/hero_model.dart';
import 'package:rickandmorty/features/favorite_screen/bloc/favorite_list_bloc.dart';
import 'package:rickandmorty/features/global/widgets/hero_card.dart';
import 'package:rickandmorty/features/main_screen/bloc/hero_list_bloc.dart';

class HeroesCardsList extends StatelessWidget {
  const HeroesCardsList({super.key, required this.data, this.controller});

  final List<HeroModel> data;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteListBloc, FavoriteListState>(
      builder: (context, favoriteState) {
        List<HeroModel> favorites = [];
        if (favoriteState is FavoriteListLoaded) {
          favorites = favoriteState.favorites;
        }
        return GridView.builder(
          itemCount: data.length,
          controller: controller,
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 16,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final hero = data[index];
            final isFavorite = favorites.any((fav) => fav.id == hero.id);
            return InkWell(
              onTap: () {
                context.read<HeroListBloc>().add(LoadHeroDetails(id: hero.id));
                context.go('/details/${hero.id}');
              },
              child: HeroCard(
                data: hero,
                isfavorite: isFavorite,
                onTapToFavoriteButton: () {
                  final favoriteBloc = context.read<FavoriteListBloc>();
                  if (isFavorite) {
                    favoriteBloc.add(RemoveFavorite(hero: hero));
                  } else {
                    favoriteBloc.add(AddFavorite(hero: hero));
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
