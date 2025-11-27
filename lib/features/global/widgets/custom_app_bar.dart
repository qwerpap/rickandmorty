import 'package:flutter/material.dart';
import '../../../core/theme/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: Text(title, style: AppStyles.title)),
    );
  }
}
