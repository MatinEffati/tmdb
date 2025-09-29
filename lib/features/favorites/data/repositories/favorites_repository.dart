import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures.dart';
import 'package:tmdb/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:tmdb/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:tmdb/features/movie_list/data/models/movie_model.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource localDataSource;

  FavoritesRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> add(Movie movie) async {
    try {
      final movieModel = MovieModel.fromEntity(movie);
      await localDataSource.addToFavorites(movieModel);
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure("Cache failure"));
    }
  }

  @override
  Future<Either<Failure, void>> remove(int id) async {
    try {
      await localDataSource.removeFromFavorites(id);
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure("Cache failure"));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getAll() async {
    try {
      final movies = await localDataSource.getFavorites();
      return Right(movies);
    } catch (e) {
      return const Left(CacheFailure("Cache failure"));
    }
  }

  @override
  Future<Either<Failure, bool>> exists(int id) async {
    try {
      final exists = await localDataSource.isFavorite(id);
      return Right(exists);
    } catch (e) {
      return const Left(CacheFailure("Cache failure"));
    }
  }
}
