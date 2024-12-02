import '../../models/movie_credits_model/movie_credits_model.dart';

abstract class MovieCreditState {}

class MovieCreditInit extends MovieCreditState {}

class MovieCreditsLoading extends MovieCreditState {}

class MovieCreditsLoaded extends MovieCreditState {
  MovieCreditsModel? movieCreditsModel;

  MovieCreditsLoaded({this.movieCreditsModel});
}

class MovieCreditsError extends MovieCreditState {
  String? message;

  MovieCreditsError(this.message);
}
