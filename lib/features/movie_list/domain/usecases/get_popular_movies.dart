import 'package:dartz/dartz.dart';
import 'package:tmdb/core/usecases/base_use_case.dart';
import 'package:tmdb/core/usecases/no_params.dart';
import '../../../../core/error/failures.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetPopularMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return repository.getPopularMovies();
  }
}
