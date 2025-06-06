import 'package:flutter/material.dart';
import 'package:rickandmorty/data/models/hero_model.dart';
import 'package:rickandmorty/features/hero_details_screen/widgets/arrow_back_button.dart';
import 'package:rickandmorty/features/hero_details_screen/widgets/details_cards_list.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, required this.hero});

  final HeroModel hero;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Image.network(
              hero.image,
              fit: BoxFit.cover,
              height: 350,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: InfoCardsList(hero: hero),
            ),
          ],
        ),
        ArrowBackButton(),
      ],
    );
  }
}
