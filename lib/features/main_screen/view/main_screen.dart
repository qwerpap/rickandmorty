import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/global/widgets/custom_app_bar.dart';
import 'package:rickandmorty/features/global/widgets/load_error.dart';
import 'package:rickandmorty/features/main_screen/bloc/hero_list_bloc.dart';
import 'package:rickandmorty/features/main_screen/widgets/heroes_cards_list.dart';
import 'package:rickandmorty/theme/app_strings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    context.read<HeroListBloc>().add(LoadHeroList());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<HeroListBloc>().add(LoadNextPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(title: AppStrings.navHome),
      ),
      body: BlocBuilder<HeroListBloc, HeroListState>(
        builder: (context, state) {
          if (state is HeroListLoaded) {
            return HeroesCardsList(
              data: state.heroes,
              controller: _scrollController,
            );
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
    );
  }
}
