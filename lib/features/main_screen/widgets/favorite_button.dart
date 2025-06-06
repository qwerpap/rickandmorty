import 'package:flutter/material.dart';
import 'package:rickandmorty/theme/app_colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
  });

  final VoidCallback onTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          isFavorite ? Icons.star : Icons.star_border,
          size: 30,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
