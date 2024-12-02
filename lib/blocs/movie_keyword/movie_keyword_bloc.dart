// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumitama_movie/blocs/movie_keyword/movie_keyword_event.dart';
import 'package:bumitama_movie/blocs/movie_keyword/movie_keyword_state.dart';
import 'package:bumitama_movie/repository/movie_keyword/movie_keyword_repository.dart';

class MovieKeywordBloc extends Bloc<MovieKeywordEvent, MovieKeywordState> {
  int? movieId;
  MovieKeywordRepository? movieKeywordRepository;

  MovieKeywordBloc({
    this.movieId,
    this.movieKeywordRepository,
  }) : super(MovieKeywordInit()) {
    on<FetchMovieKeyword>((event, emit) async {
      try {
        emit(MovieKeywordLoading());

        var resultData = await movieKeywordRepository?.fetchMovieKeyword(
          movieId: '${event.movieId}',
        );

        if (resultData != null) {
          emit(MovieKeywordLoaded(movieKeywordModel: resultData));
        } else {
          emit(MovieKeywordLoaded());
        }
      } on HttpException catch (e) {
        emit(MovieKeywordError(e.message));
      }
    });

    add(FetchMovieKeyword(
      movieId: movieId,
    ));
  }
}
