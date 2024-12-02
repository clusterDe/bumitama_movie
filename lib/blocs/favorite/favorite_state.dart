import '../../models/movie_feed_model/components/movie_feed.dart';

abstract class FavoriteState {}

class FavoriteInit extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  List<MovieFeed>? favoriteMovies;
  int? page;

  FavoriteLoaded({this.favoriteMovies, this.page});
}

class FavoriteError extends FavoriteState {
  String? message;

  FavoriteError(this.message);
}
