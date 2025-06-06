import 'package:flutter/material.dart';
import 'package:rickandmorty/data/models/hero_model.dart';
import 'package:rickandmorty/features/hero_details_screen/widgets/info_card.dart';
import 'package:rickandmorty/theme/app_strings.dart';
import 'package:rickandmorty/theme/image_source.dart';

class InfoCardsList extends StatelessWidget {
  const InfoCardsList({super.key, required this.hero});

  final HeroModel hero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoCard(
          title: AppStrings.detailName,
          svg: ImageSource.navProfile,
          detail: hero.name,
        ),
        SizedBox(height: 16),
        InfoCard(
          title: AppStrings.detailStatus,
          svg: ImageSource.navFavorite,
          detail: hero.status,
        ),
        SizedBox(height: 16),
        InfoCard(
          title: AppStrings.detailSpecies,
          svg: ImageSource.navProfile,
          detail: hero.species,
        ),
        SizedBox(height: 16),
        InfoCard(
          title: AppStrings.detailSpecies,
          svg: ImageSource.navFavorite,
          detail: hero.gender,
        ),
      ],
    );
  }
}
