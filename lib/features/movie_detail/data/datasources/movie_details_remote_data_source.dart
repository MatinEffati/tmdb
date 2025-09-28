import 'package:tmdb/core/network/network_client.dart';
import 'package:tmdb/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:tmdb/features/movie_detail/domain/entities/movie_detail.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieDetail> getMovieDetail(int id);
}

class MovieDetailRemoteDataSourceImpl implements MovieDetailRemoteDataSource {
  final NetworkClient client;

  MovieDetailRemoteDataSourceImpl(this.client);

  @override
  Future<MovieDetail> getMovieDetail(int id) async {
    final response = await client.get('/movie/$id');
    return MovieDetailModel.fromJson(response.data);
  }
}
