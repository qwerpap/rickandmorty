import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/data/repositories/sources/get_hero_api.dart';
import 'package:rickandmorty/features/main_screen/bloc/hero_list_bloc.dart';
import 'package:rickandmorty/features/navigation/widgets/app_router.dart';
import 'package:rickandmorty/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}

final router = AppRouter.router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HeroListBloc(GetHeroApi(dio: Dio()))),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
