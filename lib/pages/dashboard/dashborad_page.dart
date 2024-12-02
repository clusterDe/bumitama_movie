import 'package:bumitama_movie/pages/favorite/favorite_page.dart';
import 'package:bumitama_movie/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bumitama_movie/blocs/dashboard/dashboard_bloc.dart';
import 'package:bumitama_movie/blocs/dashboard/dashboard_event.dart';
import 'package:bumitama_movie/blocs/dashboard/dashboard_state.dart';
import '../now_playing/now_playing_page.dart';
import '../upcoming/upcoming_page.dart';

class DashboradPage extends StatelessWidget {
  static const String routeName = '/';
  const DashboradPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        var selectedIndex = state.selectedIndex;

        return Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: const [
              NowPlayingPage(),
              UpcomingPage(),
              FavoritePage(),
              SearchPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.shifting,
            useLegacyColorScheme: true,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.purple,
            onTap: (value) {
              context.read<DashboardBloc>().add(ChangePage(value));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline),
                activeIcon: Icon(Icons.play_circle),
                label: 'Now Playing',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.upcoming_outlined),
                activeIcon: Icon(Icons.upcoming),
                label: 'Upcoming',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
          ),
        );
      },
    );
  }
}
