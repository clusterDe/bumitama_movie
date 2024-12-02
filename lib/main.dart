import 'package:bumitama_movie/blocs/add_favorite/add_favorite_bloc.dart';
import 'package:bumitama_movie/blocs/dashboard/dashboard_bloc.dart';
import 'package:bumitama_movie/blocs/favorite/favorite_bloc.dart';
import 'package:bumitama_movie/blocs/movie/movie_bloc.dart';
import 'package:bumitama_movie/blocs/search/search_bloc.dart';
import 'package:bumitama_movie/blocs/themes/theme_bloc.dart';
import 'package:bumitama_movie/blocs/themes/theme_state.dart';
import 'package:bumitama_movie/blocs/upcoming/upcoming_bloc.dart';
import 'package:bumitama_movie/repository/favorite/favorite_repository.dart';
import 'package:bumitama_movie/repository/movie_repository/movie_repository.dart';
import 'package:bumitama_movie/repository/search/search_repository.dart';
import 'package:bumitama_movie/repository/upcoming/upcoming_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repository/add_favorite/add_favorite_repository.dart';
import 'routes/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => DashboardBloc(),
        ),
        BlocProvider(
          create: (context) => MovieBloc(movieRepository: MovieRepository()),
        ),
        BlocProvider(
          create: (context) =>
              UpcomingBloc(upcomingRepository: UpcomingRepository()),
        ),
        BlocProvider(
          create: (context) =>
              FavoriteBloc(favoriteRepository: FavoriteRepository()),
        ),
        BlocProvider(
          create: (context) => AddFavoriteBloc(
            addFavoriteRepository: AddFavoriteRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => SearchBloc(
            searchRepository: SearchRepository(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            title: 'Bumitama Movie',
            theme: themeState.themeData,
            routerDelegate: route.routerDelegate,
            routeInformationParser: route.routeInformationParser,
            routeInformationProvider: route.routeInformationProvider,
          );
        },
      ),
    );
  }
}
