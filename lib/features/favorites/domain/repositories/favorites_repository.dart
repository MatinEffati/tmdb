import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, void>> add(Movie movie);
  Future<Either<Failure, void>> remove(int id);
  Future<Either<Failure, List<Movie>>> getAll();
  Future<Either<Failure, bool>> exists(int id);
}
