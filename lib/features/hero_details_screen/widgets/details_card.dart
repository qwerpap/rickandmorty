import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../main_screen/domain/models/hero_model.dart';
import 'arrow_back_button.dart';
import 'details_cards_list.dart';

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
        ArrowBackButton(
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
