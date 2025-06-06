import 'package:flutter/material.dart';
import 'package:rickandmorty/data/models/hero_model.dart';
import 'package:rickandmorty/features/main_screen/widgets/hero_card.dart';

class HeroesCardsList extends StatelessWidget {
  const HeroesCardsList({super.key, required this.data});

  final List<HeroModel> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
        childAspectRatio: 0.68,
      ),
      itemBuilder:
          (context, index) => HeroCard(
            data: data[index],
            onTapToFavoriteButton: () {},
            isfavorite: false,
          ),
    );
  }
}
