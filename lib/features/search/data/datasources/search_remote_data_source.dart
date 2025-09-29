import 'package:tmdb/core/network/network_client.dart';
import 'package:tmdb/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:tmdb/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:tmdb/features/movie_list/data/models/movie_model.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<Movie>> searchMovies(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final NetworkClient client;

  SearchRemoteDataSourceImpl(this.client);

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final response = await client.get('/search/movie', queryParameters: {'query': query});
    final results = response.data['results'] as List;
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }
}
