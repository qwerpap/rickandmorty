import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rickandmorty/theme/app_colors.dart';
import 'package:rickandmorty/theme/app_styles.dart';
import 'package:rickandmorty/theme/image_source.dart';

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
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(
            ImageSource.navProfile,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(width: 16),
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
