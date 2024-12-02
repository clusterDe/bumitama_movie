// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumitama_movie/blocs/movie_credit/movie_credit_event.dart';
import 'package:bumitama_movie/blocs/movie_credit/movie_credit_state.dart';
import 'package:bumitama_movie/repository/credits/movie_credits_repository.dart';

class MovieCreditBloc extends Bloc<MovieCreditEvent, MovieCreditState> {
  int? movieId;
  MovieCreditsRepository? movieCreditsRepository;

  MovieCreditBloc({
    this.movieId,
    this.movieCreditsRepository,
  }) : super(MovieCreditInit()) {
    on<FetchMovieCredits>((event, emit) async {
      try {
        emit(MovieCreditsLoading());

        var resultData = await movieCreditsRepository?.fetchMovieCredit(
          movieDetailId: '${event.movieId}',
        );

        if (resultData != null) {
          emit(MovieCreditsLoaded(movieCreditsModel: resultData));
        } else {
          emit(MovieCreditsLoaded());
        }
      } on HttpException catch (e) {
        emit(MovieCreditsError(e.message));
      }
    });

    add(FetchMovieCredits(
      movieId: movieId,
    ));
  }
}
