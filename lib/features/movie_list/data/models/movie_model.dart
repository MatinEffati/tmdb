
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "overview": overview,
    "poster_path": posterPath,
    "vote_average": voteAverage,
  };
}
