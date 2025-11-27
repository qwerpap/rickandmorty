import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/bloc/bloc_providers.dart';
import 'package:rickandmorty/core/di/di.dart';
import 'package:rickandmorty/core/navigation/presentation/widgets/app_router.dart';
import 'package:rickandmorty/core/theme/app_theme.dart';
import 'package:rickandmorty/core/theme/bloc/theme_bloc.dart';
void main() {
  BlocProviders.setup();

  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (_) => getIt<ThemeBloc>(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
