import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/di/service_locator.dart';
import '../bloc/movie_list_bloc.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieListBloc(sl()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Popular Movies")),
        body: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            if (state is MovieListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieListLoaded) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return ListTile(
                    leading: Image.network("https://image.tmdb.org/t/p/w200${movie.posterPath}", width: 50),
                    title: Text(movie.title),
                    subtitle: Text("⭐ ${movie.voteAverage}"),
                  );
                },
              );
            } else if (state is MovieListError) {
              return Center(child: Text(state.message));
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
      ),
    );
  }
}
