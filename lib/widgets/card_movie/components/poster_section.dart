import 'package:bumitama_movie/repository/api/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:bumitama_movie/widgets/card_movie/components/favorite_button.dart';
import '../../../models/movie_feed_model/components/movie_feed.dart';
import '../../cached_image/cached_image.dart';
import 'rating_section.dart';

class PosterSection extends StatelessWidget {
  const PosterSection({
    super.key,
    this.movieFeed,
    this.favValue,
  });

  final MovieFeed? movieFeed;
  final bool? favValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          height: 180,
          child: CachedImage(
            url: '$imageUrl${movieFeed?.posterPath}',
          ),
        ),
        Positioned(
          bottom: -15,
          child: RatingSection(rating: movieFeed?.voteAverage),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: SizedBox.square(
            dimension: 35,
            child: ButtonFavorite(
              movieFeed: movieFeed,
              favValue: favValue,
            ),
          ),
        ),
      ],
    );
  }
}
