import 'package:bumitama_movie/blocs/movie_credit/movie_credit_bloc.dart';
import 'package:bumitama_movie/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:bumitama_movie/blocs/movie_keyword/movie_keyword_bloc.dart';
import 'package:bumitama_movie/pages/dashboard/dashborad_page.dart';
import 'package:bumitama_movie/pages/favorite/favorite_page.dart';
import 'package:bumitama_movie/pages/movie_detail/movie_detail_page.dart';
import 'package:bumitama_movie/pages/now_playing/now_playing_page.dart';
import 'package:bumitama_movie/pages/search/search_page.dart';
import 'package:bumitama_movie/pages/upcoming/upcoming_page.dart';
import 'package:bumitama_movie/repository/credits/movie_credits_repository.dart';
import 'package:bumitama_movie/repository/movie_detail_repository/movie_detail_repository.dart';
import 'package:bumitama_movie/repository/movie_keyword/movie_keyword_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter route = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: DashboradPage.routeName,
  restorationScopeId: DashboradPage.routeName,
  routes: [
    GoRoute(
      path: DashboradPage.routeName,
      name: DashboradPage.routeName,
      builder: (context, state) {
        return const DashboradPage();
      },
      routes: [
        GoRoute(
          path: NowPlayingPage.routeName,
          name: NowPlayingPage.routeName,
          builder: (context, state) => const NowPlayingPage(),
        ),
        GoRoute(
          path: UpcomingPage.routeName,
          name: UpcomingPage.routeName,
          builder: (context, state) => const UpcomingPage(),
        ),
        GoRoute(
          path: FavoritePage.routeName,
          name: FavoritePage.routeName,
          builder: (context, state) => const FavoritePage(),
        ),
        GoRoute(
          path: SearchPage.routeName,
          name: SearchPage.routeName,
          builder: (context, state) => const SearchPage(),
        ),
      ],
    ),
    GoRoute(
      path: MovieDetailPage.routeName,
      name: MovieDetailPage.routeName,
      builder: (context, state) {
        var extra = state.extra;

        if (extra is int) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MovieDetailBloc(
                  movieId: extra,
                  movieDetailRepository: MovieDetailRepository(),
                ),
              ),
              BlocProvider(
                create: (context) => MovieCreditBloc(
                  movieId: extra,
                  movieCreditsRepository: MovieCreditsRepository(),
                ),
              ),
              BlocProvider(
                create: (context) => MovieKeywordBloc(
                  movieId: extra,
                  movieKeywordRepository: MovieKeywordRepository(),
                ),
              ),
            ],
            child: const MovieDetailPage(),
          );
        }
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MovieDetailBloc(
                movieDetailRepository: MovieDetailRepository(),
              ),
            ),
            BlocProvider(
              create: (context) => MovieCreditBloc(
                movieCreditsRepository: MovieCreditsRepository(),
              ),
            ),
            BlocProvider(
              create: (context) => MovieKeywordBloc(
                movieKeywordRepository: MovieKeywordRepository(),
              ),
            ),
          ],
          child: const MovieDetailPage(),
        );
      },
    ),
  ],
);
