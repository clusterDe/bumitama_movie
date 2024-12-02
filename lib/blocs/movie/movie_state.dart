import 'package:bumitama_movie/models/movie_feed_model/components/movie_feed.dart';

abstract class MovieState {}

class MovieInit extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  List<MovieFeed> movies;
  int? page;

  MovieLoaded(this.movies, this.page);
}

class MovieError extends MovieState {
  String? message;

  MovieError(this.message);
}
