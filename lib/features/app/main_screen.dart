import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/config/app_colors.dart';
import 'package:tmdb/core/di/service_locator.dart';
import 'package:tmdb/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:tmdb/features/movie_list/presentation/bloc/movie_list_bloc.dart';
import 'package:tmdb/features/movie_list/presentation/screens/movie_list_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(create: (_) => MovieListBloc(sl())..add(FetchPopularMovies()), child: const MovieListScreen()),
    const Scaffold(),
    const FavoritesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
