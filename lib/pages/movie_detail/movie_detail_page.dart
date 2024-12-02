import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumitama_movie/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:bumitama_movie/blocs/movie_detail/movie_detail_state.dart';
import 'components/budget_section.dart';
import 'components/cast_and_crew.dart';
import 'components/detail_movie_section.dart';
import 'components/movie_keyword_section.dart';
import 'components/poster_section.dart';

class MovieDetailPage extends StatelessWidget {
  static const String routeName = '/movie-detail';
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is MovieDetailError) {
            return Center(
              child: Text('${state.message}'),
            );
          } else if (state is MovieDetailLoaded) {
            var movieDetail = state.movieDetail;

            return ListView(
              children: [
                PosterSection(movieDetail: movieDetail),
                DetailMovieSection(movieDetail: movieDetail),
                const CastAndCrew(),
                BudgetSection(movieDetail: movieDetail),
                const MovieKeywordSection(),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
