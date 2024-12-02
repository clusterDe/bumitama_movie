import 'dart:io';

import 'package:bumitama_movie/blocs/movie/movie_event.dart';
import 'package:bumitama_movie/blocs/movie/movie_state.dart';
import 'package:bumitama_movie/models/movie_feed_model/components/movie_feed.dart';
import 'package:bumitama_movie/repository/movie_repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepository? movieRepository;

  MovieBloc({this.movieRepository}) : super(MovieInit()) {
    on<FetchMovie>((event, emit) async {
      try {
        if (event.page == 1) {
          emit(MovieLoading());
        }

        var list = await movieRepository?.fetchMovie(event.page!);
        var currentState = state;

        if (currentState is MovieLoaded) {
          var updateMovie = List<MovieFeed>.from(currentState.movies)
            ..addAll(list!);

          emit(MovieLoaded(updateMovie, event.page));
        } else {
          emit(MovieLoaded(list!, event.page));
        }
      } on HttpException catch (e) {
        emit(MovieError(e.message));
      }
    });
  }
}
