import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/details_card.dart';
import '../../main_screen/bloc/hero_list_bloc.dart';
import '../../main_screen/domain/models/hero_model.dart';
import '../../../core/theme/app_strings.dart';

class HeroDetailsScreen extends StatefulWidget {
  const HeroDetailsScreen({super.key, required this.heroId});
  final int heroId;

  @override
  State<HeroDetailsScreen> createState() => _HeroDetailsScreenState();
}

class _HeroDetailsScreenState extends State<HeroDetailsScreen> {
  HeroModel? _cachedHero;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<HeroListBloc>();
    final currentState = bloc.state;
    
    if (currentState is HeroDetailsLoaded && 
        currentState.hero.id == widget.heroId) {
      _cachedHero = currentState.hero;
    } else if (currentState is HeroListLoaded) {
      try {
        final hero = currentState.heroes.firstWhere(
          (h) => h.id == widget.heroId,
        );
        _cachedHero = hero;
      } catch (e) {
      }
    }
    
    if (_cachedHero == null) {
      bloc.add(LoadHeroDetails(id: widget.heroId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HeroListBloc, HeroListState>(
        buildWhen: (previous, current) {
          if (current is HeroDetailsLoaded) {
            return current.hero.id == widget.heroId;
          }
          return current is HeroListFailure || 
                 (current is HeroListLoading && _cachedHero == null);
        },
        builder: (context, state) {
          if (_cachedHero != null) {
            return DetailsCard(hero: _cachedHero!);
          }
          
          if (state is HeroDetailsLoaded && state.hero.id == widget.heroId) {
            _cachedHero = state.hero;
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
