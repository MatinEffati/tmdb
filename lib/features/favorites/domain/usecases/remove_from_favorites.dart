import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures.dart';
import 'package:tmdb/core/usecases/base_use_case.dart';
import 'package:tmdb/features/favorites/domain/repositories/favorites_repository.dart';

class RemoveFromFavorites implements UseCase<void, int> {
  final FavoritesRepository repository;

  RemoveFromFavorites(this.repository);

  @override
  Future<Either<Failure, void>> call(int id) async {
    return repository.remove(id);
  }
}