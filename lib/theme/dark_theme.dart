import 'package:flutter/material.dart';
import 'package:rickandmorty/theme/app_colors.dart';

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    color: AppColors.blackColor,
    surfaceTintColor: AppColors.blackColor,
  ),
  scaffoldBackgroundColor: AppColors.blackColor,
);
