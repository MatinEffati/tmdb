import 'package:mockito/annotations.dart';
import 'package:tmdb/core/network/network_client.dart';
import 'package:tmdb/features/movie_list/data/datasources/movie_remote_data_source.dart';
import 'package:tmdb/features/movie_list/data/repositories/movie_repository.dart';
import 'package:tmdb/features/movie_list/domain/usecases/get_popular_movies.dart';

@GenerateMocks([
  NetworkClient,
  MovieRemoteDataSource,
  MovieRepositoryImpl,
  GetPopularMovies,
])
void main() {}
