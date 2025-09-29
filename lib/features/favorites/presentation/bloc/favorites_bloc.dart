import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/core/usecases/no_params.dart';
import 'package:tmdb/features/favorites/domain/usecases/add_to_favorites.dart';
import 'package:tmdb/features/favorites/domain/usecases/check_favorite.dart';
import 'package:tmdb/features/favorites/domain/usecases/get_favorites.dart';
import 'package:tmdb/features/favorites/domain/usecases/remove_from_favorites.dart';
import 'package:tmdb/features/movie_list/domain/entities/movie_entity.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final AddToFavorites addToFavorites;
  final RemoveFromFavorites removeFavorite;
  final GetFavorites getFavorites;
  final CheckFavorite checkFavorite;

  FavoritesBloc({
    required this.addToFavorites,
    required this.removeFavorite,
    required this.getFavorites,
    required this.checkFavorite,
  }) : super(FavoritesInitial()) {
    on<LoadFavoritesEvent>((event, emit) async {
      emit(FavoritesLoading());
      final result = await getFavorites(NoParams());
      result.fold((failure) => emit(FavoritesError(failure.message)), (movies) => emit(FavoritesLoaded(movies)));
    });

    on<AddFavoriteEvent>((event, emit) async {
      await addToFavorites(event.movie);
      add(LoadFavoritesEvent());
    });

    on<RemoveFavoriteEvent>((event, emit) async {
      await removeFavorite(event.id);
      add(LoadFavoritesEvent());
    });

    on<CheckFavoriteEvent>((event, emit) async {
      final result = await checkFavorite(event.id);
      result.fold((failure) => emit(FavoritesError(failure.message)), (exists) => emit(FavoriteStatus(exists)));
    });
  }
}
