import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/add_favorite/add_favorite_bloc.dart';
import '../../../blocs/add_favorite/add_favorite_event.dart';

import '../../../constant.dart';
import '../../../models/movie_feed_model/components/movie_feed.dart';

class ButtonFavorite extends StatefulWidget {
  const ButtonFavorite({
    super.key,
    this.movieFeed,
    this.favValue,
  });

  final MovieFeed? movieFeed;
  final bool? favValue;

  @override
  State<ButtonFavorite> createState() => _ButtonFavoriteState();
}

class _ButtonFavoriteState extends State<ButtonFavorite> {
  MovieFeed? get movieFeed => widget.movieFeed;

  check(BuildContext context) async {
    var addFavBloc = context.read<AddFavoriteBloc>();
    var data = FetchAddFavorite(
      mediaType: 'movie',
      movieId: movieFeed?.id,
      favorite: widget.favValue,
    );

    addFavBloc.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      tooltip: 'Add Favorite',
      elevation: defPadding,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defBorderRadius),
      ),
      clipBehavior: Clip.hardEdge,
      onSelected: (value) {
        check(context);
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'favorite',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite_outline,
              ),
              SizedBox(width: defPadding / 2),
              Text('Favorite'),
            ],
          ),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.5),
        ),
        child: const Icon(Icons.more_horiz),
      ),
    );
  }
}
