import 'package:flutter/material.dart';
import '../../main_screen/domain/models/hero_model.dart';
import '../../main_screen/widgets/favorite_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/theme/app_strings.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
    required this.onTapToFavoriteButton,
    required this.isfavorite,
    required this.data,
  });

  final VoidCallback onTapToFavoriteButton;
  final bool isfavorite;
  final HeroModel data;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
                child: Image.network(
                  data.image,
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
                Text(
                  data.name,
                  style: AppStyles.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text('${AppStrings.statusLabel} ${data.status}', style: AppStyles.subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
