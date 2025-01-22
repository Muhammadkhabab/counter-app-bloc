import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_events.dart';
import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_states.dart';
import 'package:bloc_counter_app/models/favorite_model/favorite_model.dart';
import 'package:bloc_counter_app/repository/favorite_respository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<FavoriteModel> favoriteModel = [];
  List<FavoriteModel> temporaryFavoriteList = [];

  FavoriteRepository favoriteRepository;
  FavoriteBloc(this.favoriteRepository) : super(FavoriteState()) {
    on<FetchFavoriteList>(fetchFavoriteList);
    on<AddFavorite>(_addFavorite);
    on<DeleteItem>(deleteItem);
    on<SelectItem>(selectItem);
    on<UnSelectItem>(unselectedItem);
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
      if (temporaryFavoriteList.contains(favoriteModel[addFavorite])) {
        temporaryFavoriteList.remove(favoriteModel[addFavorite]);
        temporaryFavoriteList.add(event.favoriteItem);
      }
    } else {
      if (temporaryFavoriteList.contains(favoriteModel[addFavorite])) {
        temporaryFavoriteList.remove(favoriteModel[addFavorite]);
        temporaryFavoriteList.add(event.favoriteItem);
      }
    }
    favoriteModel[addFavorite] = event.favoriteItem;
    emit(
      state.copyWith(
        favoriteModel: List.from(favoriteModel),
        temporaryList: List.from(temporaryFavoriteList),
      ),
    );
  }

  void selectItem(SelectItem event, Emitter<FavoriteState> emit) {
    temporaryFavoriteList.add(event.item);
    emit(state.copyWith(temporaryList: List.from(temporaryFavoriteList)));
  }

  void unselectedItem(UnSelectItem event, Emitter<FavoriteState> emit) {
    temporaryFavoriteList.remove(event.item);
    emit(state.copyWith(temporaryList: List.from(temporaryFavoriteList)));
  }

  void deleteItem(DeleteItem event, Emitter<FavoriteState> emit) {
    for (int i = 0; i < temporaryFavoriteList.length; i++) {
      favoriteModel.remove(temporaryFavoriteList[i]);
    }

    temporaryFavoriteList.clear();
    emit(
      state.copyWith(
        temporaryList: List.from(temporaryFavoriteList),
        favoriteModel: List.from(favoriteModel),
      ),
    );
  }
}
