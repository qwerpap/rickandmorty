import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data/database/hero_database.dart';
import 'package:rickandmorty/data/repositories/sources/heroes_repository.dart';
import 'package:rickandmorty/features/favorite_screen/bloc/favorite_list_bloc.dart';
import 'package:rickandmorty/features/main_screen/bloc/hero_list_bloc.dart';
import 'package:rickandmorty/features/navigation/widgets/app_router.dart';
import 'package:rickandmorty/theme/theme.dart';

void main() {
  final db = HeroesDatabase();
  final repo = HeroesRepository(dio: Dio(), db: db);

  runZonedGuarded(() => runApp(MyApp(db: db, repo: repo)), (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}

final router = AppRouter.router;

class MyApp extends StatelessWidget {
  final HeroesDatabase db;
  final HeroesRepository repo;

  const MyApp({required this.db, required this.repo, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HeroListBloc(repo)),
        BlocProvider(
          create: (_) => FavoriteListBloc(db)..add(LoadFavoriteList()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
