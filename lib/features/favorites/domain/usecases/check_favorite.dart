import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures.dart';
import 'package:tmdb/core/usecases/base_use_case.dart';
import 'package:tmdb/features/favorites/domain/repositories/favorites_repository.dart';

class CheckFavorite implements UseCase<bool, int> {
  final FavoritesRepository repository;

  CheckFavorite(this.repository);

  @override
  Future<Either<Failure, bool>> call(int id) async {
    return repository.exists(id);
  }
}