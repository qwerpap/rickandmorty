import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global/widgets/custom_app_bar.dart';
import '../../global/widgets/load_error.dart';
import '../bloc/hero_list_bloc.dart';
import '../widgets/heroes_cards_list.dart';
import '../../../../core/theme/app_strings.dart';

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
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(title: AppStrings.navHome),
      ),
      body: BlocBuilder<HeroListBloc, HeroListState>(
        builder: (context, state) {
          if (state is HeroDetailsLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final bloc = context.read<HeroListBloc>();
              if (bloc.state is HeroDetailsLoaded) {
                bloc.add(RestoreListState());
              }
            });
            return const Center(child: CircularProgressIndicator());
          }
          
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
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
