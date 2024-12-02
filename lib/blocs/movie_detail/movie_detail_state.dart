import 'package:bumitama_movie/models/movie_detail_model/movie_detail_model.dart';

abstract class MovieDetailState {}

class MovieDetailInit extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  MovieDetailModel? movieDetail;

  MovieDetailLoaded({this.movieDetail});
}

class MovieDetailError extends MovieDetailState {
  String? message;

  MovieDetailError(this.message);
}
