import 'package:bloc_counter_app/models/favorite_model/favorite_model.dart';
import 'package:equatable/equatable.dart';

//this is the enum where we can define the status of the list
enum ListStatus {
  loading,
  success,
  error,
}

class FavoriteState extends Equatable {
  final List<FavoriteModel> favoriteModel;
  final List<FavoriteModel> temporaryList;
  final ListStatus listStatus;
  const FavoriteState({
    this.favoriteModel = const [],
    this.listStatus = ListStatus.loading,
    this.temporaryList = const [],
  });

  FavoriteState copyWith({List<FavoriteModel>? favoriteModel, ListStatus? listStatus, List<FavoriteModel>? temporaryList}) {
    return FavoriteState(
      favoriteModel: favoriteModel ?? this.favoriteModel,
      listStatus: listStatus ?? this.listStatus,
      temporaryList: temporaryList ?? this.temporaryList,
    );
  }

  @override
  List<Object?> get props => [favoriteModel, listStatus, temporaryList];
}
