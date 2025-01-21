import 'package:equatable/equatable.dart';

class FavoriteModel extends Equatable {
  final String id;
  final String value;
  final bool isFavorite;
  final bool isDeleted;

  const FavoriteModel({
    required this.id,
    required this.value,
    this.isFavorite = false,
    this.isDeleted = false,
  });

  FavoriteModel copyWith({String? id, String? value, bool? isFavorite, bool? isDeleted}) {
    return FavoriteModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isFavorite: isFavorite ?? this.isFavorite,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [id, value, isFavorite, isDeleted];
}
