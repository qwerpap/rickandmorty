import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

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
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Icon(
            isFavorite ? Icons.star : Icons.star_border,
            size: 30,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
