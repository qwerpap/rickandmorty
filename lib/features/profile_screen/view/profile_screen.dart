import 'package:flutter/material.dart';
import 'package:rickandmorty/features/global/widgets/custom_app_bar.dart';
import 'package:rickandmorty/features/profile_screen/widgets/widgets.dart';
import 'package:rickandmorty/theme/app_strings.dart';
import 'package:rickandmorty/theme/image_source.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(title: AppStrings.navProfile),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          UserAvatar(avatarUrl: AppStrings.avatar),
          SizedBox(height: 32),
          SettingsCard(text: 'Сменить тему', svg: ImageSource.theme),
          SizedBox(height: 16),
          SettingsCard(text: 'Сменить тему', svg: ImageSource.theme),
          SizedBox(height: 16),
          SettingsCard(text: 'Сменить тему', svg: ImageSource.theme),
        ],
      ),
    );
  }
}
