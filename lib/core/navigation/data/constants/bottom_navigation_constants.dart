import '../models/navigation_item.dart';
import 'navigation_constants.dart';
import 'navigation_labels.dart';
import '../../../../core/theme/image_source.dart';

class BottomNavigationConstants {
  BottomNavigationConstants._();

  static const List<NavigationItem> navigationItems = [
    NavigationItem(
      iconPath: ImageSource.navHome,
      label: NavigationLabels.home,
      route: NavigationConstants.home,
    ),
    NavigationItem(
      iconPath: ImageSource.navFavorite,
      label: NavigationLabels.favorite,
      route: NavigationConstants.favorite,
    ),
    NavigationItem(
      iconPath: ImageSource.navProfile,
      label: NavigationLabels.profile,
      route: NavigationConstants.profile,
    ),
  ];
}

