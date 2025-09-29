part of 'movie_list_bloc.dart';

abstract class MovieListEvent {}

class FetchPopularMovies extends MovieListEvent {}

class ToggleFavorite extends MovieListEvent {
  final Movie movie;

  ToggleFavorite(this.movie);
}
