import 'package:tmdb/core/network/network_client.dart';
import '../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final NetworkClient client;

  MovieRemoteDataSourceImpl(this.client);

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get('/movie/popular');
    final results = response.data['results'] as List;
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }
}
