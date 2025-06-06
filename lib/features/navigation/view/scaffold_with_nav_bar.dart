import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/theme/app_colors.dart';
import 'package:rickandmorty/theme/app_strings.dart';
import 'package:rickandmorty/theme/image_source.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  late PageController _pageController;

  void _onTap(BuildContext context, int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.navigationShell.currentIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.children,
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.navActiveColor,
          // selectedLabelStyle: AppStyles.navLabelActive,
          // unselectedLabelStyle: AppStyles.navLabelInactiveWhiteTheme,
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
          items: [
            getBottomNavigationBarItem(
              AppColors.navActiveColor,
              AppColors.navInactiveColor,
              ImageSource.navHome,
              AppStrings.navHome,
            ),
            getBottomNavigationBarItem(
              AppColors.navActiveColor,
              AppColors.navInactiveColor,
              ImageSource.navFavorite,
              AppStrings.navFavorite,
            ),
            getBottomNavigationBarItem(
              AppColors.navActiveColor,
              AppColors.navInactiveColor,
              ImageSource.navProfile,
              AppStrings.navProfile,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem getBottomNavigationBarItem(
    Color activeColor,
    Color inactiveColor,
    String svgAssetName,
    String label,
  ) => BottomNavigationBarItem(
    icon: SvgPicture.asset(
      svgAssetName,
      height: 21,
      colorFilter: ColorFilter.mode(inactiveColor, BlendMode.srcIn),
    ),
    activeIcon: SvgPicture.asset(
      svgAssetName,
      height: 21,
      colorFilter: ColorFilter.mode(activeColor, BlendMode.srcIn),
    ),
    label: label,
  );
}
