import 'package:go_router/go_router.dart';
import 'package:rickandmorty/features/favorite_screen/view/favorite_screen.dart';
import 'package:rickandmorty/features/main_screen/view/main_screen.dart';
import 'package:rickandmorty/features/navigation/view/scaffold_with_nav_bar.dart';
import 'package:rickandmorty/features/profile_screen/view/profile_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const HomeScreen(),
      // ),
      StatefulShellRoute(
        builder: (context, state, navigationShell) {
          return navigationShell;
        },
        navigatorContainerBuilder: (context, navigationShell, children) {
          return ScaffoldWithNavBar(
            navigationShell: navigationShell,
            children: children,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const MainScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorite',
                builder: (context, state) => const FavoriteScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
