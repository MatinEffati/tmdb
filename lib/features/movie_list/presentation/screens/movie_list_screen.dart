import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/components/big_error_widget.dart';
import 'package:tmdb/core/di/service_locator.dart';
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
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          if (state is MovieListLoading) {
            return MovieListLoadingWidget();
          } else if (state is MovieListLoaded) {
            return MovieListLoadedWidget(movies: state.movies);
          } else if (state is MovieListError) {
            return MovieListErrorWidget(message: state.message);
          } else if (state is MovieListEmpty) {
            return MovieListEmptyWidget();
          }
          return const Center(child: Text("Press button to load movies"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MovieListBloc>().add(FetchPopularMovies());
        },
        child: const Icon(Icons.refresh),
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
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (_) => MovieDetailsBloc(getMovieDetails: sl())..add(FetchMovieDetailsEvent(movie.id)),
                child: MovieDetailsScreen(movieId: movie.id),
              ),
            ),
          ),
          leading: Image.network("https://image.tmdb.org/t/p/w200${movie.posterPath}", width: 50),
          title: Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          subtitle: Text("⭐ ${movie.voteAverage}"),
          trailing: Icon(Icons.favorite_border),
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
