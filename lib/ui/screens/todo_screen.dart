import 'package:bloc_counter_app/bloc/todo/todo_bloc.dart';
import 'package:bloc_counter_app/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todo/todo_event.dart';
import '../../models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Todo Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todos.isEmpty) {
            return Center(
              child: Text('No Todos Found'),
            );
          } else if (state.todos.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return ListTile(
                        title: Text(
                          todo.tittle,
                          style: TextStyle(
                            decoration: todo.isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        subtitle: Text(todo.description),
                        leading: CircleAvatar(
                          child: Text(todo.index.toString()),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: todo.isDone,
                              onChanged: (_) {
                                context.read<TodoBloc>().add(UpdateTodoEvent(todo: todo));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context.read<TodoBloc>().add(RemoveTodoEvent(todo: todo));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: 'Description'),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final todo = TodoModel(
                  index: context.read<TodoBloc>().state.todos.length + 1,
                  tittle: titleController.text,
                  description: descriptionController.text,
                  isDone: false,
                );
                context.read<TodoBloc>().add(AddTodoEvent(todo: todo));
                Navigator.of(context).pop();
              },
              child: Text('Add Todo'),
            ),
          ],
        );
      },
    );
  }
}
