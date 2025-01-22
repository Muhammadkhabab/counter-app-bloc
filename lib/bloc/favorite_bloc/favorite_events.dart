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

//this is the select event where we select the item from the list
class SelectItem extends FavoriteEvent {
  final FavoriteModel item;
  const SelectItem({required this.item});
}

//this is the unselect event where we unselect the item from the list
class UnSelectItem extends FavoriteEvent {
  final FavoriteModel item;
  const UnSelectItem({required this.item});
}

//this is the delte event where we delet the item form the list
class DeleteItem extends FavoriteEvent {

}
