// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AddFavoriteState {}

class AddFavoriteInit extends AddFavoriteState {}

class AddFavoriteLoading extends AddFavoriteState {}

class AddFavoriteLoaded extends AddFavoriteState {
  String? message;

  AddFavoriteLoaded({this.message});
}

class AddFavoriteError extends AddFavoriteState {
  String? message;

  AddFavoriteError(this.message);
}
