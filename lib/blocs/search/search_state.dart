// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../models/movie_feed_model/components/movie_feed.dart';

abstract class SearchState {}

class SearchInit extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  List<MovieFeed>? results;
  int? page;

  SearchSuccess(
    this.results,
    this.page,
  );
}

class SearchError extends SearchState {
  final String error;

  SearchError(this.error);
}
