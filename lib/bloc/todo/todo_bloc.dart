import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/bloc/todo/todo_event.dart';
import 'package:bloc_counter_app/bloc/todo/todo_state.dart';
import 'package:bloc_counter_app/models/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todos = [];
  TodoBloc() : super(TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removePost);
    on<UpdateTodoEvent>(_updatePost);
  }

  // this is the todos list to add
  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    final updatedTodos = List<TodoModel>.from(state.todos)..add(event.todo);
    emit(state.copyWith(todos: updatedTodos));
  }

  //this is the todos list to remove
  void _removePost(RemoveTodoEvent event, Emitter<TodoState> emit) {
    final updatedTodos = List<TodoModel>.from(state.todos)..removeWhere((todos) => todos.index == event.todo.index);
    emit(state.copyWith(todos: updatedTodos));
  }

  // this is the todos list to update
  void _updatePost(UpdateTodoEvent event, Emitter<TodoState> emit) {
    final updatedTodos = state.todos.map((todo) {
      if (todo.index == event.todo.index) {
        return todo.copyWith(isDone: !todo.isDone);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: updatedTodos));
  }
}
