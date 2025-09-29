part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavoritesEvent extends FavoritesEvent {}

class AddFavoriteEvent extends FavoritesEvent {
  final Movie movie;

  const AddFavoriteEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

class RemoveFavoriteEvent extends FavoritesEvent {
  final int id;

  const RemoveFavoriteEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class CheckFavoriteEvent extends FavoritesEvent {
  final int id;

  const CheckFavoriteEvent(this.id);

  @override
  List<Object?> get props => [id];
}
