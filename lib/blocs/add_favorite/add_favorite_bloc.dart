// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumitama_movie/blocs/add_favorite/add_favorite_event.dart';
import 'package:bumitama_movie/blocs/add_favorite/add_favorite_state.dart';
import 'package:bumitama_movie/repository/add_favorite/add_favorite_repository.dart';

class AddFavoriteBloc extends Bloc<AddFavoriteEvent, AddFavoriteState> {
  AddFavoriteRepository? addFavoriteRepository;

  AddFavoriteBloc({
    this.addFavoriteRepository,
  }) : super(AddFavoriteInit()) {
    on<FetchAddFavorite>((event, emit) async {
      try {
        emit(AddFavoriteLoading());

        var result = await addFavoriteRepository?.fetchAddRepository(
          mediaType: '${event.mediaType}',
          mediaId: event.movieId!,
          favorite: event.favorite!,
        );

        if (result != null) {
          emit(AddFavoriteLoaded(message: result.statusMessage));
        } else {
          emit(AddFavoriteLoaded());
        }
      } on HttpException catch (e) {
        emit(AddFavoriteError(e.message));
      }
    });
  }
}
