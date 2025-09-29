import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';
import 'package:tmdb/features/search/domain/usecases/search_movies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies searchMovies;

  SearchBloc(this.searchMovies) : super(SearchInitial()) {
    on<PerformSearchEvent>((event, emit) async {
      emit(SearchLoading());
      final result = await searchMovies(event.query);
      result.fold(
            (failure) => emit(SearchError(failure.message)),
            (movies) {
          if (movies.isEmpty) {
            emit(SearchEmpty());
          } else {
            emit(SearchLoaded(movies));
          }
        },
      );
    });
  }
}
