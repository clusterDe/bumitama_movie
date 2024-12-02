import 'package:bumitama_movie/blocs/favorite/favorite_bloc.dart';
import 'package:bumitama_movie/blocs/favorite/favorite_event.dart';
import 'package:bumitama_movie/blocs/favorite/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../constant.dart';
import '../../widgets/card_movie/card_movie.dart';
import '../movie_detail/movie_detail_page.dart';

class FavoritePage extends StatefulWidget {
  static const String routeName = '/favorite';
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
    context.read<FavoriteBloc>().add(FetchFavorite(1));
    return;
  }

  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(FetchFavorite(_currentPage));

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        changeValMaxExtends();
        _currentPage++;
        context.read<FavoriteBloc>().add(FetchFavorite(_currentPage));
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
        title: const Text('Favorite'),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          refresh();
        },
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading && _currentPage == 1) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is FavoriteError) {
              return Center(
                child: Text('${state.message}'),
              );
            } else if (state is FavoriteLoaded) {
              var favoriteMovies = state.favoriteMovies;

              if (favoriteMovies != null && favoriteMovies.isNotEmpty) {
                return GridView.builder(
                  controller: _scrollController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(defPadding),
                  itemCount: favoriteMovies.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: defPadding,
                    crossAxisSpacing: defPadding,
                    mainAxisExtent: 290,
                  ),
                  itemBuilder: (context, index) {
                    if (index == favoriteMovies.length) {
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
                          extra: favoriteMovies[index].id,
                        );
                      },
                      movieFeed: favoriteMovies[index],
                      favValue: false,
                    );
                  },
                );
              } else {
                return ListView(
                  controller: _scrollController,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    const Center(
                      child: Text('You favorite list is empty'),
                    ),
                  ],
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
