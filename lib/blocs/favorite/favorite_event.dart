// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class FavoriteEvent {}

class FetchFavorite extends FavoriteEvent {
  int? page;

  FetchFavorite(this.page);
}
