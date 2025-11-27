import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/image_source.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.svg,
    required this.detail,
    required this.title,
  });

  final String title;
  final String svg;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(
              ImageSource.navProfile,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.detatilTitle),
            Text(
              detail,
              style: AppStyles.detatilInfo.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
