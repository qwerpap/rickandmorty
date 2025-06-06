import 'package:flutter/material.dart';
import 'package:rickandmorty/theme/app_strings.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(AppStrings.errorText),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(AppStrings.tryAgain),
          ),
        ],
      ),
    );
  }
}
