// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../models/movie_feed_model/components/movie_feed.dart';

abstract class UpcomingState {}

class UpcomingInit extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingLoaded extends UpcomingState {
  List<MovieFeed>? movies;
  int? page;

  UpcomingLoaded({
    required this.movies,
    this.page,
  });
}

class UpcomingError extends UpcomingState {
  String? message;

  UpcomingError(this.message);
}
