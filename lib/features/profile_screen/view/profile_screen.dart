import 'package:flutter/material.dart';
import '../../global/widgets/custom_app_bar.dart';
import '../widgets/widgets.dart';
import '../../../core/theme/app_strings.dart';
import '../../../core/theme/image_source.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(title: AppStrings.navProfile),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          UserAvatar(avatarUrl: AppStrings.avatar),
          const SizedBox(height: 32),
          SettingsCard(text: AppStrings.changeTheme, svg: ImageSource.theme),
          const SizedBox(height: 16),
          SettingsCard(text: AppStrings.changeTheme, svg: ImageSource.theme),
          const SizedBox(height: 16),
          SettingsCard(text: AppStrings.changeTheme, svg: ImageSource.theme),
        ],
      ),
    );
  }
}
