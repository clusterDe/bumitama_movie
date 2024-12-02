import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../helpers/date_time_helper.dart';
import '../../../models/movie_detail_model/movie_detail_model.dart';
import '../../../repository/api/api_repository.dart';
import '../../../widgets/cached_image/cached_image.dart';

class PosterSection extends StatelessWidget {
  const PosterSection({
    super.key,
    required this.movieDetail,
  });

  final MovieDetailModel? movieDetail;

  @override
  Widget build(BuildContext context) {
    var map = movieDetail?.genres
        ?.map((e) {
          return e.name;
        })
        .toList()
        .join(', ');

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: CachedImage(
            color: Colors.grey,
            blendMode: BlendMode.multiply,
            url: '$imageUrl${movieDetail?.backdropPath}',
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defPadding / 2,
                vertical: defPadding,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 150,
                    height: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defBorderRadius),
                    ),
                    child: CachedImage(
                      url: '$imageUrl${movieDetail?.posterPath}',
                    ),
                  ),
                  const SizedBox(width: defPadding),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          movieDetail?.title ?? '-',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: defPadding / 2),
                        const Text(
                          'Release Date',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          DateTimeHelper.formatDbToHuman(
                            date: '${movieDetail?.releaseDate}',
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: defPadding / 2),
                        const Text(
                          'Genres',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Wrap(
                          children: [
                            Text(
                              map ?? '-',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: defPadding / 2),
                        const Text(
                          'Status',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          movieDetail?.status ?? '-',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: defPadding / 2),
                        const Text(
                          'Rating',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '${movieDetail?.voteAverage ?? '-'}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
