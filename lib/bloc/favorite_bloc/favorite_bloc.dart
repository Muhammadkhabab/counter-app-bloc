import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_events.dart';
import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_states.dart';
import 'package:bloc_counter_app/models/favorite_model/favorite_model.dart';
import 'package:bloc_counter_app/repository/favorite_respository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<FavoriteModel> favoriteModel = [];
  List<FavoriteModel> tempraryFavoriteList = [];

  FavoriteRepository favoriteRepository;
  FavoriteBloc(this.favoriteRepository) : super(FavoriteState()) {
    on<FetchFavoriteList>(fetchFavoriteList);
    on<AddFavorite>(_addFavorite);
  }

  void fetchFavoriteList(FavoriteEvent event, Emitter<FavoriteState> emit) async {
    favoriteModel = await favoriteRepository.fetchItems();
    emit(
      state.copyWith(
        favoriteModel: List.from(favoriteModel),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _addFavorite(AddFavorite event, Emitter<FavoriteState> emit) async {
    final addFavorite = favoriteModel.indexWhere((element) => element.id == event.favoriteItem.id);
    if (event.favoriteItem.isFavorite) {
      if (tempraryFavoriteList.contains(favoriteModel[addFavorite])) {
        tempraryFavoriteList.remove(favoriteModel[addFavorite]);
      } else {
        tempraryFavoriteList.add(event.favoriteItem);
      }
    } else {
      if (tempraryFavoriteList.contains(favoriteModel[addFavorite])) {
        tempraryFavoriteList.remove(favoriteModel[addFavorite]);
      } else {
        tempraryFavoriteList.add(event.favoriteItem);
      }
    }
    favoriteModel[addFavorite] = event.favoriteItem;
    emit(
      state.copyWith(
        favoriteModel: List.from(favoriteModel),
        listStatus: ListStatus.success,
      ),
    );
  }
}
