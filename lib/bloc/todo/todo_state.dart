import 'package:bloc_counter_app/models/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<TodoModel> todos;
  const TodoState({this.todos = const []});

  TodoState copyWith({List<TodoModel>? todos}) {
    return TodoState(todos: todos ?? this.todos);
  }

  @override
  List<Object> get props => [todos];
}
