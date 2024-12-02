import 'package:flutter/material.dart';

import 'package:bumitama_movie/models/movie_feed_model/components/movie_feed.dart';

import '../../constant.dart';
import '../../helpers/date_time_helper.dart';
import 'components/poster_section.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    super.key,
    this.press,
    this.movieFeed,
    this.favValue,
  });

  final VoidCallback? press;
  final MovieFeed? movieFeed;
  final bool? favValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: 115,
        height: 280,
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defBorderRadius),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(-3, 5),
              blurRadius: defPadding / 3,
            )
          ],
        ),
        child: Column(
          children: [
            PosterSection(
              movieFeed: movieFeed,
              favValue: favValue,
            ),
            const SizedBox(height: defPadding + 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defPadding / 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieFeed?.title ?? '-',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: defPadding / 3),
                    Text(
                      DateTimeHelper.formatDbToHuman(
                          date: '${movieFeed?.releaseDate}'),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
