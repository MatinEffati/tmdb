import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/di/service_locator.dart';
import 'package:tmdb/features/favorites/presentation/bloc/favorites_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          FavoritesBloc(addToFavorites: sl(), removeFavorite: sl(), getFavorites: sl(), checkFavorite: sl())
            ..add(LoadFavoritesEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Favorites")),
        body: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoritesLoaded) {
              if (state.movies.isEmpty) {
                return const Center(child: Text("No favorites yet."));
              }
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return ListTile(
                    leading: Image.network("https://image.tmdb.org/t/p/w200${movie.posterPath}"),
                    title: Text(movie.title),
                    subtitle: Text("⭐ ${movie.voteAverage}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<FavoritesBloc>().add(RemoveFavoriteEvent(movie.id));
                      },
                    ),
                  );
                },
              );
            } else if (state is FavoritesError) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
