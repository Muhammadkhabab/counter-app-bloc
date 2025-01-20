import 'package:bloc_counter_app/models/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object> get props => [];
}

//add event to add a to the list of todos
class AddTodoEvent extends TodoEvent {
  final TodoModel todo;
  const AddTodoEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class RemoveTodoEvent extends TodoEvent {
  final TodoModel todo;
  const RemoveTodoEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class UpdateTodoEvent extends TodoEvent {
  final TodoModel todo;
  const UpdateTodoEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}
