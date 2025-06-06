import 'package:flutter/material.dart';
import 'package:rickandmorty/features/main_screen/widgets/hero_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Set<int> favorites = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          itemCount: 10,
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 16,
            childAspectRatio: 0.68,
          ),
          itemBuilder:
              (context, index) => HeroCard(
                name: 'Hero name',
                status: 'Dead',
                onTapToFavoriteButton: () {},
                isfavorite: false,
              ),
        ),
      ),
    );
  }
}
