import 'package:bumitama_movie/blocs/movie_keyword/movie_keyword_bloc.dart';
import 'package:bumitama_movie/blocs/movie_keyword/movie_keyword_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';

class MovieKeywordSection extends StatelessWidget {
  const MovieKeywordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieKeywordBloc, MovieKeywordState>(
        builder: (context, state) {
      if (state is MovieKeywordLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (state is MovieKeywordError) {
        return Center(
          child: Text('${state.message}'),
        );
      } else if (state is MovieKeywordLoaded) {
        var movieKeyword = state.movieKeywordModel;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: defPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defPadding),
              const Text(
                'Keywords',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: defPadding / 2),
              Wrap(
                spacing: defPadding / 2,
                runSpacing: defPadding / 2,
                children: List.generate(
                  movieKeyword!.keywords!.length,
                  (index) => Container(
                    padding: const EdgeInsets.all(defPadding / 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(defBorderRadius),
                    ),
                    child: Text(
                      movieKeyword.keywords?[index].name ?? '-',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defPadding),
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
