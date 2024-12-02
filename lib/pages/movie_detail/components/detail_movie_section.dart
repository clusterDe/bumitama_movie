import 'package:bumitama_movie/constant.dart';
import 'package:flutter/material.dart';

import '../../../models/movie_detail_model/movie_detail_model.dart';

class DetailMovieSection extends StatelessWidget {
  const DetailMovieSection({
    super.key,
    required this.movieDetail,
  });

  final MovieDetailModel? movieDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defPadding),
      child: Column(
        children: [
          Builder(builder: (context) {
            if (movieDetail?.tagline != null &&
                movieDetail!.tagline!.isNotEmpty) {
              return Column(
                children: [
                  const SizedBox(height: defPadding),
                  Text(
                    movieDetail?.tagline ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
          const SizedBox(height: defPadding),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Overview',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: defPadding / 2),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              movieDetail?.overview ?? '-',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
