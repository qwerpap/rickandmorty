import 'package:flutter/material.dart';
import 'package:rickandmorty/features/navigation/widgets/app_router.dart';
import 'package:rickandmorty/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

final router = AppRouter.router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: router,
    );
  }
}
