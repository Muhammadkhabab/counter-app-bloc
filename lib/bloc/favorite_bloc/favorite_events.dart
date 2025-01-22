import 'package:bloc_counter_app/models/favorite_model/favorite_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoriteList extends FavoriteEvent {}

//this is the favorite event for the add the favorite item.
class AddFavorite extends FavoriteEvent {
  final FavoriteModel favoriteItem;

  const AddFavorite({required this.favoriteItem});
}
