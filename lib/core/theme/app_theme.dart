import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      color: AppColors.blackColor,
      surfaceTintColor: AppColors.blackColor,
    ),
    scaffoldBackgroundColor: AppColors.blackColor,
  );
}

