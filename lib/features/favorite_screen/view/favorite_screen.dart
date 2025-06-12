import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/favorite_screen/bloc/favorite_list_bloc.dart';
import 'package:rickandmorty/features/favorite_screen/widgets/favorites_cards_list.dart';
import 'package:rickandmorty/features/favorite_screen/widgets/sort_dropdown.dart';
import 'package:rickandmorty/features/global/widgets/custom_app_bar.dart';
import 'package:rickandmorty/features/global/widgets/load_error.dart';
import 'package:rickandmorty/theme/app_strings.dart';
import 'package:rickandmorty/theme/app_styles.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(title: AppStrings.navFavorite),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: const FavoriteSortDropdown(),
          ),
          Expanded(
            child: BlocBuilder<FavoriteListBloc, FavoriteListState>(
              builder: (context, state) {
                if (state is FavoriteListLoaded) {
                  final favorites = state.favorites;
                  if (favorites.isEmpty) {
                    return const Center(
                      child: Text(
                        AppStrings.favListEmpty,
                        style: AppStyles.subtitle,
                      ),
                    );
                  }
                  return FavoritesCardsList(favorites: favorites);
                } else if (state is FavoriteListFailure) {
                  return LoadError(
                    onPressed: () {
                      context.read<FavoriteListBloc>().add(LoadFavoriteList());
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
