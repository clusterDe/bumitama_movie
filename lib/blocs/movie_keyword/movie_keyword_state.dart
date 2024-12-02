// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bumitama_movie/models/movie_keyword_model/movie_keyword_model.dart';

abstract class MovieKeywordState {}

class MovieKeywordInit extends MovieKeywordState {}

class MovieKeywordLoading extends MovieKeywordState {}

class MovieKeywordLoaded extends MovieKeywordState {
  MovieKeywordModel? movieKeywordModel;

  MovieKeywordLoaded({this.movieKeywordModel});
}

class MovieKeywordError extends MovieKeywordState {
  String? message;

  MovieKeywordError(this.message);
}
