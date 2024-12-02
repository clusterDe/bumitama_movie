import 'package:bumitama_movie/blocs/search/search_bloc.dart';
import 'package:bumitama_movie/blocs/search/search_event.dart';
import 'package:bumitama_movie/blocs/search/search_state.dart';
import 'package:bumitama_movie/constant.dart';
import 'package:bumitama_movie/widgets/card_movie/card_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../movie_detail/movie_detail_page.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = 'search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isMaxExtends = false;
  String query = '';

  changeValMaxExtends() {
    setState(() {
      _isMaxExtends = !_isMaxExtends;
    });
  }

  refresh() async {
    _currentPage = 1;
    context.read<SearchBloc>().add(SearchQuery('', 1));
    return;
  }

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(SearchQuery('', _currentPage));

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        changeValMaxExtends();
        _currentPage++;
        context.read<SearchBloc>().add(SearchQuery(query, _currentPage));

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
        title: const Text('Search'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defPadding),
            child: TextFormField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });

                context
                    .read<SearchBloc>()
                    .add(SearchQuery(value, _currentPage));
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchInit) {
            return const Center(
                child: Text('Enter a query to start searching'));
          } else if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchSuccess) {
            var results = state.results;
            if (results == null || results.isEmpty) {
              return const Center(child: Text('No results found'));
            } else {
              return GridView.builder(
                controller: _scrollController,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(defPadding),
                itemCount: results.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: defPadding,
                  crossAxisSpacing: defPadding,
                  mainAxisExtent: 290,
                ),
                itemBuilder: (context, index) {
                  if (index == results.length) {
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
                        extra: results[index].id,
                      );
                    },
                    movieFeed: results[index],
                    favValue: true,
                  );
                },
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
