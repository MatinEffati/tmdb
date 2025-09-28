import 'package:bloc/bloc.dart';
import 'package:tmdb/core/usecases/no_params.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';
import 'package:tmdb/features/movie_list/domain/usecases/get_popular_movies.dart';

part 'movie_list_event.dart';

part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetPopularMovies getPopularMovies;

  MovieListBloc(this.getPopularMovies) : super(MovieListInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(MovieListLoading());
      final result = await getPopularMovies(NoParams());
      result.fold((failure) => emit(MovieListError(failure.message)), (movies) => emit(MovieListLoaded(movies)));
    });
  }
}
