import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures.dart';
import 'package:tmdb/core/usecases/base_use_case.dart';
import 'package:tmdb/core/usecases/no_params.dart';
import 'package:tmdb/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';

class GetFavorites implements UseCase<List<Movie>, NoParams> {
  final FavoritesRepository repository;

  GetFavorites(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return repository.getAll();
  }
}