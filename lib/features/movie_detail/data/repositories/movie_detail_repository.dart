import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures.dart';
import 'package:tmdb/features/movie_detail/data/datasources/movie_details_remote_data_source.dart';
import 'package:tmdb/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:tmdb/features/movie_detail/domain/repositories/movie_details_repository.dart';

class MovieDetailRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailRemoteDataSource remoteDataSource;

  MovieDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(int id) async {
    try {
      final movieDetail = await remoteDataSource.getMovieDetail(id);
      return Right(movieDetail);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
