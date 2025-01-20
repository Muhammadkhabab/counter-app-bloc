import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String tittle;
  final String description;
  final int index;
  final bool isDone;

  const TodoModel({
    required this.tittle,
    required this.description,
    required this.index,
    required this.isDone,
  });

  TodoModel copyWith({String? tittle, String? description, int? index, bool? isDone}) {
    return TodoModel(
      tittle: tittle ?? this.tittle,
      description: description ?? this.description,
      index: index ?? this.index,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [tittle, description, index, isDone];
}
