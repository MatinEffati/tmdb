import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb/core/network/network_client.dart';
import 'package:tmdb/features/movie_list/data/datasources/movie_remote_data_source.dart';
import 'package:tmdb/features/movie_list/data/repositories/movie_repository.dart';
import 'package:tmdb/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:tmdb/features/movie_list/domain/usecases/get_popular_movies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Network
  sl.registerLazySingleton<NetworkClient>(() => NetworkClient());

  // Data sources
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(sl()));
}
