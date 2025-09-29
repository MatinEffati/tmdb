import 'package:hive/hive.dart';
import 'package:tmdb/features/movie_list/data/models/movie_model.dart';

abstract class FavoritesLocalDataSource {
  Future<void> addToFavorites(MovieModel movie);
  Future<void> removeFromFavorites(int id);
  Future<List<MovieModel>> getFavorites();
  Future<bool> isFavorite(int id);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  static const String boxName = 'favoritesBox';

  @override
  Future<void> addToFavorites(MovieModel movie) async {
    final box = await Hive.openBox<MovieModel>(boxName);
    await box.put(movie.id, movie);
  }

  @override
  Future<void> removeFromFavorites(int id) async {
    final box = await Hive.openBox<MovieModel>(boxName);
    await box.delete(id);
  }

  @override
  Future<List<MovieModel>> getFavorites() async {
    final box = await Hive.openBox<MovieModel>(boxName);
    return box.values.toList();
  }

  @override
  Future<bool> isFavorite(int id) async {
    final box = await Hive.openBox<MovieModel>(boxName);
    return box.containsKey(id);
  }
}
