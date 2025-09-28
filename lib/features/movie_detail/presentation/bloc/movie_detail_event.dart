part of 'movie_detail_bloc.dart';


abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const FetchMovieDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}
