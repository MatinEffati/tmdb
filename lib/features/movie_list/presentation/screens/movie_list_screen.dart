import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/components/big_error_widget.dart';
import 'package:tmdb/core/components/cached_image.dart';
import 'package:tmdb/core/di/service_locator.dart';
import 'package:tmdb/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:tmdb/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:tmdb/features/movie_detail/presentation/screens/movie_details_screen.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';
import '../bloc/movie_list_bloc.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Popular Movies")),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<MovieListBloc>().add(FetchPopularMovies());
        },
        child: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            if (state is MovieListLoading) {
              return MovieListLoadingWidget();
            } else if (state is MovieListLoaded) {
              return MovieListLoadedWidget(
                movies: state.movies,
              );
            } else if (state is MovieListError) {
              return MovieListErrorWidget(message: state.message);
            } else if (state is MovieListEmpty) {
              return MovieListEmptyWidget();
            }
            return const Center(child: Text("Press button to load movies"));
          },
        ),
      ),
    );
  }
}

class MovieListLoadingWidget extends StatelessWidget {
  const MovieListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class MovieListLoadedWidget extends StatelessWidget {
  const MovieListLoadedWidget({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        final favIds = state is FavoritesLoaded
            ? state.movies.map((m) => m.id).toSet()
            : <int>{};

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            final isFavorite = favIds.contains(movie.id);

            return ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (_) => MovieDetailsBloc(getMovieDetails: sl())
                      ..add(FetchMovieDetailsEvent(movie.id)),
                    child: MovieDetailsScreen(movieId: movie.id),
                  ),
                ),
              ),
              leading: CachedImage(
                imageUrl: "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                width: 50,
                height: 100,
                borderRadius: BorderRadius.circular(4),
              ),
              title: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("⭐ ${movie.voteAverage.toStringAsFixed(1)}"),
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  final favoritesBloc = context.read<FavoritesBloc>();
                  if (isFavorite) {
                    favoritesBloc.add(RemoveFavoriteEvent(movie.id));
                  } else {
                    favoritesBloc.add(AddFavoriteEvent(movie));
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}

class MovieListEmptyWidget extends StatelessWidget {
  const MovieListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LargeErrorContainer(
        onPressed: () {},
        title: 'List is Empty',
        svgThumbnail: 'assets/lottie/connection_error.json',
      ),
    );
  }
}

class MovieListErrorWidget extends StatelessWidget {
  const MovieListErrorWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LargeErrorContainer(
        activeLargeButton: true,
        titleActionButton: 'Try again',
        onPressed: () {
          context.read<MovieListBloc>().add(FetchPopularMovies());
        },
        title: message,
        svgThumbnail: 'assets/lottie/connection_error.json',
      ),
    );
  }
}
