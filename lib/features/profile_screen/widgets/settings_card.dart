import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/theme/bloc/theme_bloc.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key, required this.text, required this.svg});

  final String text;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppStyles.buttonStyle,
      onPressed: () {
        final currentState = context.read<ThemeBloc>().state;
        final isDarkMode = currentState.themeMode == ThemeMode.dark;
        context.read<ThemeBloc>().add(ToggleTheme(isDarkMode: !isDarkMode));
      },
      child: Row(
        children: [
          SvgPicture.asset(svg, height: 25),
          const SizedBox(width: 10),
          Text(text, style: AppStyles.subtitle),
        ],
      ),
    );
  }
}
