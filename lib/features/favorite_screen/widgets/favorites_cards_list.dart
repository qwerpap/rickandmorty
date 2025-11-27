import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../main_screen/domain/models/hero_model.dart';
import '../bloc/favorite_list_bloc.dart';
import '../../global/widgets/hero_card.dart';
import '../../main_screen/bloc/hero_list_bloc.dart';

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
        return InkWell(
          onTap: () {
            context.read<HeroListBloc>().add(LoadHeroDetails(id: hero.id));
            context.push('/details/${hero.id}');
          },
          child: HeroCard(
            data: hero,
            isfavorite: true,
            onTapToFavoriteButton: () {
              context.read<FavoriteListBloc>().add(RemoveFavorite(hero: hero));
            },
          ),
        );
      },
    );
  }
}
