import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures.dart';
import 'package:tmdb/core/usecases/base_use_case.dart';
import 'package:tmdb/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';

class AddToFavorites implements UseCase<void, Movie> {
  final FavoritesRepository repository;

  AddToFavorites(this.repository);

  @override
  Future<Either<Failure, void>> call(Movie movie) async {
    return repository.add(movie);
  }
}
