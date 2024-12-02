abstract class MovieKeywordEvent {}

class FetchMovieKeyword extends MovieKeywordEvent {
  int? movieId;

  FetchMovieKeyword({this.movieId});
}
