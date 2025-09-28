import 'package:dartz/dartz.dart';
import 'package:tmdb/features/movie_list/data/datasources/movie_remote_data_source.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final movies = await remoteDataSource.getPopularMovies();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
