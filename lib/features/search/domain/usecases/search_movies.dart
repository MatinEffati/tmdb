import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures.dart';
import 'package:tmdb/core/usecases/base_use_case.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';

import '../repositories/search_repository.dart';

class SearchMovies extends UseCase<List<Movie>, String> {
  final SearchRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
