import 'package:flutter/material.dart';

class NavigationIcons {
  NavigationIcons._();

  static const IconData home = Icons.home;
  static const IconData favorite = Icons.favorite;
  static const IconData profile = Icons.person;

  static IconData getIconByRoute(String route) {
    switch (route) {
      case '/':
        return home;
      case '/favorite':
        return favorite;
      case '/profile':
        return profile;
      default:
        return home;
    }
  }
}

