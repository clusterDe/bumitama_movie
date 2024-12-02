// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumitama_movie/blocs/search/search_event.dart';
import 'package:bumitama_movie/blocs/search/search_state.dart';
import 'package:bumitama_movie/repository/search/search_repository.dart';

import '../../models/movie_feed_model/components/movie_feed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepository? searchRepository;
  SearchBloc({
    this.searchRepository,
  }) : super(SearchInit()) {
    on<SearchQuery>((event, emit) async {
      if (event.query!.isEmpty) {
        emit(SearchInit());
        return;
      }

      if (event.page == 1) {
        emit(SearchLoading());
      }

      try {
        var list = await searchRepository?.fetchSearchQuery(
          query: '${event.query}',
          page: event.page,
        );
        var currentState = state;

        if (currentState is SearchSuccess) {
          var updateMovie = List<MovieFeed>.from(currentState.results!)
            ..addAll(list!);

          emit(SearchSuccess(updateMovie, event.page));
        } else {
          emit(SearchSuccess(list, event.page));
        }
      } catch (e) {
        emit(SearchError('Failed to fetch results'));
      }
    });
  }
}
