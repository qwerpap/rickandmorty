import 'package:flutter/material.dart';
import 'package:rickandmorty/features/global/widgets/custom_app_bar.dart';
import 'package:rickandmorty/theme/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(title: AppStrings.navProfile),
      ),
    );
  }
}
