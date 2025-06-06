import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/hero_details_screen/widgets/details_card.dart';
import 'package:rickandmorty/features/main_screen/bloc/hero_list_bloc.dart';
import 'package:rickandmorty/theme/app_strings.dart';

class HeroDetailsScreen extends StatelessWidget {
  const HeroDetailsScreen({super.key, required this.heroId});
  final int heroId;

  @override
  Widget build(BuildContext context) {
    context.read<HeroListBloc>().add(LoadHeroDetails(id: heroId));
    return Scaffold(
      body: BlocBuilder<HeroListBloc, HeroListState>(
        builder: (context, state) {
          if (state is HeroDetailsLoaded) {
            return DetailsCard(hero: state.hero);
          }
          if (state is HeroListFailure) {
            return const Center(child: Text(AppStrings.errorText));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
