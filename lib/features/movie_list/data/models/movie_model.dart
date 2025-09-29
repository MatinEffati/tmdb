import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';

import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends Movie {
  @override
  @HiveField(0)
  final int id;

  @override
  @HiveField(1)
  final String title;

  @override
  @HiveField(2)
  final String posterPath;

  @override
  @HiveField(3)
  final double voteAverage;

  @override
  @HiveField(4)
  final String overview;

  const MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.overview,
  }) : super(id: id, title: title, posterPath: posterPath, voteAverage: voteAverage, overview: overview);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 00).toDouble(),
      overview: json['overview'] ?? '',
    );
  }

  factory MovieModel.fromEntity(Movie movie) => MovieModel(
    id: movie.id,
    title: movie.title,
    posterPath: movie.posterPath,
    voteAverage: movie.voteAverage,
    overview: movie.overview,
  );
}
