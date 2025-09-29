import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/config/app_colors.dart';
import 'package:tmdb/core/di/service_locator.dart';
import 'package:tmdb/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:tmdb/features/movie_list/presentation/bloc/movie_list_bloc.dart';
import 'package:tmdb/features/movie_list/presentation/screens/movie_list_screen.dart';
import 'package:tmdb/features/search/presentation/bloc/search_bloc.dart';
import 'package:tmdb/features/search/presentation/screens/search_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  late final MovieListBloc _movieListBloc;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _movieListBloc = MovieListBloc(sl())..add(FetchPopularMovies());

    _pages = [
      BlocProvider.value(value: _movieListBloc, child: const MovieListScreen()),
      BlocProvider(create: (context) => SearchBloc(sl()),child: const SearchScreen(),),
      const FavoritesScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _movieListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColorsLight.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
