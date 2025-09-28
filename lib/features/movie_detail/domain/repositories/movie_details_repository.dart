import 'package:dartz/dartz.dart';
import 'package:tmdb/core/error/failures.dart';

import '../entities/movie_detail.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetail>> getMovieDetails(int id);
}
