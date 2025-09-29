import 'package:get_it/get_it.dart';
import 'package:tmdb/core/network/network_client.dart';
import 'package:tmdb/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:tmdb/features/favorites/data/repositories/favorites_repository.dart';
import 'package:tmdb/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:tmdb/features/favorites/domain/usecases/add_to_favorites.dart';
import 'package:tmdb/features/favorites/domain/usecases/check_favorite.dart';
import 'package:tmdb/features/favorites/domain/usecases/get_favorites.dart';
import 'package:tmdb/features/favorites/domain/usecases/remove_from_favorites.dart';
import 'package:tmdb/features/movie_detail/data/datasources/movie_details_remote_data_source.dart';
import 'package:tmdb/features/movie_detail/data/repositories/movie_detail_repository.dart';
import 'package:tmdb/features/movie_detail/domain/repositories/movie_details_repository.dart';
import 'package:tmdb/features/movie_detail/domain/usecases/get_movie_details.dart';
import 'package:tmdb/features/movie_list/data/datasources/movie_remote_data_source.dart';
import 'package:tmdb/features/movie_list/data/repositories/movie_repository.dart';
import 'package:tmdb/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:tmdb/features/movie_list/domain/usecases/get_popular_movies.dart';
import 'package:tmdb/features/search/data/datasources/search_remote_data_source.dart';
import 'package:tmdb/features/search/data/repositories/search_repository.dart';
import 'package:tmdb/features/search/domain/repositories/search_repository.dart';
import 'package:tmdb/features/search/domain/usecases/search_movies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Network
  sl.registerLazySingleton<NetworkClient>(() => NetworkClient());

  // Data sources
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<MovieDetailRemoteDataSource>(() => MovieDetailRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<FavoritesLocalDataSource>(() => FavoritesLocalDataSourceImpl());
  sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
  sl.registerLazySingleton<MovieDetailsRepository>(() => MovieDetailRepositoryImpl(sl()));
  sl.registerLazySingleton<FavoritesRepository>(() => FavoritesRepositoryImpl(sl()));
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(remoteDataSource: sl()));

  // Use cases
  sl.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(sl()));
  sl.registerLazySingleton<GetMovieDetails>(() => GetMovieDetails(sl()));
  sl.registerLazySingleton<AddToFavorites>(() => AddToFavorites(sl()));
  sl.registerLazySingleton<GetFavorites>(() => GetFavorites(sl()));
  sl.registerLazySingleton<CheckFavorite>(() => CheckFavorite(sl()));
  sl.registerLazySingleton<RemoveFromFavorites>(() => RemoveFromFavorites(sl()));
  sl.registerLazySingleton<SearchMovies>(() => SearchMovies(sl()));
}
