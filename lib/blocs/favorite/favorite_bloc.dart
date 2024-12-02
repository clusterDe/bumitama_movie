// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumitama_movie/blocs/favorite/favorite_event.dart';
import 'package:bumitama_movie/blocs/favorite/favorite_state.dart';
import 'package:bumitama_movie/repository/favorite/favorite_repository.dart';

import '../../models/movie_feed_model/components/movie_feed.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteRepository? favoriteRepository;

  FavoriteBloc({this.favoriteRepository}) : super(FavoriteInit()) {
    on<FetchFavorite>((event, emit) async {
      try {
        if (event.page == 1) {
          emit(FavoriteLoading());
        }

        var list = await favoriteRepository?.fetchFavorite(
          page: event.page!,
        );
        var currentState = state;

        if (currentState is FavoriteLoaded) {
          var updateMovie = List<MovieFeed>.from(currentState.favoriteMovies!)
            ..addAll(list!);

          emit(FavoriteLoaded(
            favoriteMovies: updateMovie,
            page: event.page,
          ));
        } else {
          emit(FavoriteLoaded(
            favoriteMovies: list,
            page: event.page,
          ));
        }
      } on HttpException catch (e) {
        emit(FavoriteError(e.message));
      }
    });
  }
}
