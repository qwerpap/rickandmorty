import 'package:flutter/material.dart';
import 'package:rickandmorty/features/main_screen/view/main_screen.dart';
import 'package:rickandmorty/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MainScreen(),
    );
  }
}
