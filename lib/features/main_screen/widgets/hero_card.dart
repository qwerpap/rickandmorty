import 'package:flutter/material.dart';
import 'package:rickandmorty/features/main_screen/widgets/favorite_button.dart';
import 'package:rickandmorty/theme/app_colors.dart';
import 'package:rickandmorty/theme/app_strings.dart';
import 'package:rickandmorty/theme/app_styles.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
    required this.name,
    required this.status,
    required this.onTapToFavoriteButton,
    required this.isfavorite,
  });

  final String name;
  final String status;
  final VoidCallback onTapToFavoriteButton;
  final bool isfavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                child: Image.network(
                  AppStrings.testImage,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: FavoriteButton(
                  onTap: onTapToFavoriteButton,
                  isFavorite: isfavorite,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppStyles.title),
                Text('Status: $status'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
