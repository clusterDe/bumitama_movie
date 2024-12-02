abstract class MovieDetailEvent {}

class FetchMovieDetail extends MovieDetailEvent {
  int? movieDetailId;

  FetchMovieDetail({this.movieDetailId});
}
