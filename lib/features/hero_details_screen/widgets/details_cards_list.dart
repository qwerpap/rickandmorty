import 'package:flutter/material.dart';
import '../../main_screen/domain/models/hero_model.dart';
import 'info_card.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/theme/image_source.dart';

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
        const SizedBox(height: 16),
        InfoCard(
          title: AppStrings.detailStatus,
          svg: ImageSource.navFavorite,
          detail: hero.status,
        ),
        const SizedBox(height: 16),
        InfoCard(
          title: AppStrings.detailSpecies,
          svg: ImageSource.navProfile,
          detail: hero.species,
        ),
        const SizedBox(height: 16),
        InfoCard(
          title: AppStrings.detailSpecies,
          svg: ImageSource.navFavorite,
          detail: hero.gender,
        ),
      ],
    );
  }
}
