import 'package:flutter/widgets.dart';
import 'package:rickandmorty/theme/app_colors.dart';

class AppStyles {
  static const title = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const subtitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const detatilTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );

  static const detatilInfo = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );
}
