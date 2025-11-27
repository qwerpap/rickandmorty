import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../domain/models/hero_model.dart';
import '../../favorite_screen/bloc/favorite_list_bloc.dart';
import '../../global/widgets/hero_card.dart';
import '../bloc/hero_list_bloc.dart';

class HeroesCardsList extends StatelessWidget {
  const HeroesCardsList({super.key, required this.data, this.controller});

  final List<HeroModel> data;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteListBloc, FavoriteListState>(
      buildWhen: (previous, current) => current is FavoriteListLoaded,
      builder: (context, favoriteState) {
        final favorites = favoriteState is FavoriteListLoaded
            ? favoriteState.favorites
            : <HeroModel>[];
        return GridView.builder(
          itemCount: data.length,
          controller: controller,
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                context.push('/details/${hero.id}');
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
