import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../di/di.dart';
import '../../features/favorite_screen/bloc/favorite_list_bloc.dart';
import '../../features/favorite_screen/data/database/favorite_database.dart';
import '../../features/favorite_screen/data/datasources/favorite_local_datasource.dart';
import '../../features/favorite_screen/data/repositories/favorite_repository_impl.dart';
import '../../features/favorite_screen/domain/repositories/favorite_repository.dart';
import '../../features/main_screen/bloc/hero_list_bloc.dart';
import '../../features/main_screen/data/database/hero_database.dart';
import '../../features/main_screen/data/datasources/hero_local_datasource.dart';
import '../../features/main_screen/data/datasources/hero_remote_datasource.dart';
import '../../features/main_screen/data/repositories/hero_repository_impl.dart';
import '../../features/main_screen/domain/repositories/hero_repository.dart';
import '../../core/theme/bloc/theme_bloc.dart';
import '../navigation/presentation/cubit/navigation_cubit.dart';

class BlocProviders {
  BlocProviders._();

  static void setup() {
    _registerDatabase();
    _registerDatasources();
    _registerRepositories();
    _registerHeroListBloc();
    _registerFavoriteListBloc();
    _registerThemeBloc();
    _registerNavigationCubit();
  }

  static void _registerDatabase() {
    getIt.registerLazySingleton<HeroesDatabase>(() => HeroesDatabase());
    getIt.registerLazySingleton<FavoriteDatabase>(() => FavoriteDatabase());
  }

  static void _registerDatasources() {
    getIt.registerFactory<HeroRemoteDataSource>(
      () => HeroRemoteDataSourceImpl(dio: Dio()),
    );
    getIt.registerFactory<HeroLocalDataSource>(
      () => HeroLocalDataSourceImpl(db: getIt<HeroesDatabase>()),
    );
    getIt.registerFactory<FavoriteLocalDataSource>(
      () => FavoriteLocalDataSourceImpl(db: getIt<FavoriteDatabase>()),
    );
  }

  static void _registerRepositories() {
    getIt.registerFactory<HeroRepository>(
      () => HeroRepositoryImpl(
        remoteDataSource: getIt<HeroRemoteDataSource>(),
        localDataSource: getIt<HeroLocalDataSource>(),
      ),
    );
    getIt.registerFactory<FavoriteRepository>(
      () => FavoriteRepositoryImpl(
        localDataSource: getIt<FavoriteLocalDataSource>(),
      ),
    );
  }

  static void _registerHeroListBloc() {
    getIt.registerFactory<HeroListBloc>(
      () => HeroListBloc(getIt<HeroRepository>()),
    );
  }

  static void _registerFavoriteListBloc() {
    getIt.registerFactory<FavoriteListBloc>(
      () {
        final bloc = FavoriteListBloc(
          getIt<FavoriteRepository>(),
          getIt<HeroRepository>(),
        );
        bloc.add(LoadFavoriteList());
        return bloc;
      },
    );
  }

  static void _registerThemeBloc() {
    getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  }

  static void _registerNavigationCubit() {
    getIt.registerFactoryParam<NavigationCubit, String, bool>(
      (currentLocation, isDark) => NavigationCubit(
        currentLocation: currentLocation,
        isDark: isDark,
      ),
    );
  }

  static Widget wrapWithProviders({
    required BuildContext context,
    required Widget child,
  }) {
    final currentLocation = GoRouterState.of(context).uri.path;
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = brightness == Brightness.dark;

    return MultiBlocProvider(
      providers: [
        BlocProvider<HeroListBloc>(
          create: (_) => getIt<HeroListBloc>(),
        ),
        BlocProvider<FavoriteListBloc>(
          create: (_) => getIt<FavoriteListBloc>(),
        ),
        BlocProvider.value(
          value: getIt<ThemeBloc>(),
        ),
        BlocProvider<NavigationCubit>(
          create: (_) => getIt<NavigationCubit>(
            param1: currentLocation,
            param2: isDark,
          ),
        ),
      ],
      child: child,
    );
  }
}
