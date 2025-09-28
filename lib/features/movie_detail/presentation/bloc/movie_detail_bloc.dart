import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:tmdb/features/movie_detail/domain/usecases/get_movie_details.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;

  MovieDetailsBloc({required this.getMovieDetails}) : super(MovieDetailsInitial()) {
    on<FetchMovieDetailsEvent>((event, emit) async {
      emit(MovieDetailsLoading());
      final result = await getMovieDetails(event.id);
      result.fold((failure) => emit(MovieDetailsError(failure.message)), (movie) => emit(MovieDetailsLoaded(movie)));
    });
  }
}
