import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_events.dart';
import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_states.dart';
import 'package:bloc_counter_app/models/favorite_model/favorite_model.dart';
import 'package:bloc_counter_app/repository/favorite_respository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<FavoriteModel> favoriteModel = [];

  FavoriteRepository favoriteRepository;
  FavoriteBloc(this.favoriteRepository) : super(FavoriteState()) {
    on<FetchFavoriteList>(fetchFavoriteList);
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
}
