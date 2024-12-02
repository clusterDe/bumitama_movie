import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumitama_movie/blocs/upcoming/upcoming_event.dart';
import 'package:bumitama_movie/blocs/upcoming/upcoming_state.dart';
import 'package:bumitama_movie/repository/upcoming/upcoming_repository.dart';

import '../../models/movie_feed_model/components/movie_feed.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingRepository? upcomingRepository;

  UpcomingBloc({
    this.upcomingRepository,
  }) : super(UpcomingInit()) {
    on<FetchUpcoming>((event, emit) async {
      try {
        if (event.page == 1) {
          emit(UpcomingLoading());
        }

        var list = await upcomingRepository?.fetchUpcoming(
          page: event.page!,
        );
        var currentState = state;

        if (currentState is UpcomingLoaded) {
          var updateMovie = List<MovieFeed>.from(currentState.movies!)
            ..addAll(list!);

          emit(UpcomingLoaded(
            movies: updateMovie,
            page: event.page,
          ));
        } else {
          emit(UpcomingLoaded(
            movies: list,
            page: event.page,
          ));
        }
      } on HttpException catch (e) {
        emit(UpcomingError(e.message));
      }
    });
  }
}
