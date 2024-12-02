import 'package:bumitama_movie/blocs/upcoming/upcoming_bloc.dart';
import 'package:bumitama_movie/blocs/upcoming/upcoming_event.dart';
import 'package:bumitama_movie/blocs/upcoming/upcoming_state.dart';
import 'package:bumitama_movie/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/card_movie/card_movie.dart';
import '../movie_detail/movie_detail_page.dart';

class UpcomingPage extends StatefulWidget {
  static const String routeName = 'upcoming';

  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isMaxExtends = false;

  changeValMaxExtends() {
    setState(() {
      _isMaxExtends = !_isMaxExtends;
    });
  }

  refresh() async {
    _currentPage = 1;
    context.read<UpcomingBloc>().add(FetchUpcoming(page: 1));
    return;
  }

  @override
  void initState() {
    super.initState();
    context.read<UpcomingBloc>().add(FetchUpcoming(page: _currentPage));

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        changeValMaxExtends();
        _currentPage++;
        context.read<UpcomingBloc>().add(FetchUpcoming(page: _currentPage));
        await Future.delayed(const Duration(seconds: 1));

        changeValMaxExtends();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming'),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          refresh();
        },
        child: BlocBuilder<UpcomingBloc, UpcomingState>(
          builder: (context, state) {
            if (state is UpcomingLoading && _currentPage == 1) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is UpcomingError) {
              return Center(
                child: Text('${state.message}'),
              );
            } else if (state is UpcomingLoaded) {
              var movies = state.movies;

              if (movies != null && movies.isNotEmpty) {
                return GridView.builder(
                  controller: _scrollController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(defPadding),
                  itemCount: movies.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: defPadding,
                    crossAxisSpacing: defPadding,
                    mainAxisExtent: 290,
                  ),
                  itemBuilder: (context, index) {
                    if (index == movies.length) {
                      return Visibility(
                        visible: _isMaxExtends,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    return CardMovie(
                      press: () {
                        context.pushNamed(
                          MovieDetailPage.routeName,
                          extra: movies[index].id,
                        );
                      },
                      movieFeed: movies[index],
                      favValue: true,
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('Upcoming list is empty'),
                );
              }
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
