import 'package:flutter/material.dart';

class NavigationConstants {
  NavigationConstants._();

  static const String home = '/';
  static const String favorite = '/favorite';
  static const String profile = '/profile';
  static const String details = '/details';

  static const Duration fastTransition = Duration(milliseconds: 200);
  static const Duration normalTransition = Duration(milliseconds: 350);
  static const Duration slowTransition = Duration(milliseconds: 500);

  static const Curve easeInOutCurve = Curves.easeInOut;
  static const Curve easeOutBackCurve = Curves.easeOutBack;
  static const Curve fastOutSlowInCurve = Curves.fastOutSlowIn;
}

