import 'package:bumitama_movie/blocs/movie_credit/movie_credit_bloc.dart';
import 'package:bumitama_movie/blocs/movie_credit/movie_credit_state.dart';
import 'package:bumitama_movie/repository/api/api_repository.dart';
import 'package:bumitama_movie/widgets/cached_image/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';

class CastAndCrew extends StatelessWidget {
  const CastAndCrew({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defPadding),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: defPadding),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Cast',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        BlocBuilder<MovieCreditBloc, MovieCreditState>(
          builder: (context, state) {
            if (state is MovieCreditsLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is MovieCreditsError) {
              return Center(
                child: Text('${state.message}'),
              );
            } else if (state is MovieCreditsLoaded) {
              var movieCredits = state.movieCreditsModel;
              return SizedBox(
                height: 325,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: defPadding),
                  scrollDirection: Axis.horizontal,
                  itemCount: movieCredits!.cast!.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: defPadding / 2,
                    ),
                    width: 150,
                    height: 300,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(defBorderRadius),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: defPadding / 3,
                          offset: Offset(-2, 5),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: CachedImage(
                            url:
                                '$imageUrl${movieCredits.cast?[index].profilePath}',
                          ),
                        ),
                        const SizedBox(height: defPadding / 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: defPadding / 2,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              movieCredits.cast?[index].name ?? '-',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: defPadding / 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: defPadding / 2,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              movieCredits.cast?[index].character ?? '-',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: defPadding / 2),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
