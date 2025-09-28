import 'package:dartz/dartz.dart';
import 'package:tmdb/core/usecases/base_use_case.dart';
import '../../../../core/error/failures.dart';
import '../entities/movie_detail.dart';
import '../repositories/movie_details_repository.dart';

class GetMovieDetails implements UseCase<MovieDetail, int> {
  final MovieDetailsRepository repository;

  GetMovieDetails(this.repository);

  @override
  Future<Either<Failure, MovieDetail>> call(int id) {
    return repository.getMovieDetails(id);
  }
}
