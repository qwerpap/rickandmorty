import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/main_screen/bloc/hero_list_bloc.dart';
import 'package:rickandmorty/features/main_screen/widgets/heroes_cards_list.dart';
import 'package:rickandmorty/features/main_screen/widgets/load_error.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HeroListBloc>().add(LoadHeroList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HeroListBloc, HeroListState>(
          builder: (context, state) {
            if (state is HeroListLoaded) {
              return HeroesCardsList(data: state.heroes);
            }
            if (state is HeroListFailure) {
              return LoadError(
                onPressed: () {
                  context.read<HeroListBloc>().add(LoadHeroList());
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
