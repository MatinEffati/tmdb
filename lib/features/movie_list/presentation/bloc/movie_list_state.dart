part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object?> get props => [];
}

class MovieListInitial extends MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListLoaded extends MovieListState {
  final List<Movie> movies;
  final Set<int> favoriteIds;

  MovieListLoaded(this.movies, {Set<int>? favoriteIds}) : favoriteIds = favoriteIds ?? {};
}

class MovieListEmpty extends MovieListState {}

class MovieListError extends MovieListState {
  final String message;

  const MovieListError(this.message);
}
