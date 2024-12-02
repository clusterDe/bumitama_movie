import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumitama_movie/blocs/movie_detail/movie_detail_event.dart';
import 'package:bumitama_movie/blocs/movie_detail/movie_detail_state.dart';
import 'package:bumitama_movie/repository/movie_detail_repository/movie_detail_repository.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  int? movieId;
  MovieDetailRepository? movieDetailRepository;

  MovieDetailBloc({
    this.movieId,
    this.movieDetailRepository,
  }) : super(MovieDetailInit()) {
    on<FetchMovieDetail>((event, emit) async {
      try {
        emit(MovieDetailLoading());

        var resultData = await movieDetailRepository?.fetchMovieDetail(
          movieDetailId: '${event.movieDetailId}',
        );

        if (resultData != null) {
          emit(MovieDetailLoaded(movieDetail: resultData));
        } else {
          emit(MovieDetailLoaded());
        }
      } on HttpException catch (e) {
        emit(MovieDetailError(e.message));
      }
    });

    add(FetchMovieDetail(
      movieDetailId: movieId,
    ));
  }
}
