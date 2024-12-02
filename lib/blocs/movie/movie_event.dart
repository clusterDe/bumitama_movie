abstract class MovieEvent {}

class FetchMovie extends MovieEvent {
  int? page;

  FetchMovie(this.page);
}

class DetailMovie extends MovieEvent {
  int? movieId;

  DetailMovie({this.movieId});
}
