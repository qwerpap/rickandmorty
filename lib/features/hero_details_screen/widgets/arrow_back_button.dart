import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: 10,
      child: CircleAvatar(
        backgroundColor: AppColors.whiteColor,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
