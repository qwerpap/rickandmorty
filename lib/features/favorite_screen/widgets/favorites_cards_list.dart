import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data/models/hero_model.dart';
import 'package:rickandmorty/features/favorite_screen/bloc/favorite_list_bloc.dart';
import 'package:rickandmorty/features/global/widgets/hero_card.dart';

class FavoritesCardsList extends StatelessWidget {
  const FavoritesCardsList({super.key, required this.favorites});

  final List<HeroModel> favorites;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final hero = favorites[index];
        return HeroCard(
          data: hero,
          isfavorite: true,
          onTapToFavoriteButton: () {
            context.read<FavoriteListBloc>().add(RemoveFavorite(hero: hero));
          },
        );
      },
    );
  }
}
