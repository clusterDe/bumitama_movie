abstract class MovieCreditEvent {}

class FetchMovieCredits extends MovieCreditEvent {
  int? movieId;

  FetchMovieCredits({this.movieId});
}
