abstract class AddFavoriteEvent {}

class FetchAddFavorite extends AddFavoriteEvent {
  String? mediaType;
  int? movieId;
  bool? favorite;

  FetchAddFavorite({
    this.mediaType,
    this.movieId,
    this.favorite,
  });
}
