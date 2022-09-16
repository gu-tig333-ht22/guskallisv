import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class todoList extends StatelessWidget {
  final List<newTodo> list;

  todoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((todo) => _todoItem(context, todo)).toList());
  }

  Widget _todoItem(context, todo) {
    var state = Provider.of<MyState>(context, listen: false);
    return Container(
        padding: EdgeInsets.only(),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: CheckboxListTile(
          title: Text(
            todo.message,
            style: (TextStyle(
              fontSize: 20,
              decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
              decorationThickness: 1,
            )),
          ),
          secondary: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              var state = Provider.of<MyState>(context, listen: false);
              state.removeTodo(todo);
            },
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: todo.isCompleted,
          onChanged: (value) {
            state.isCompleted(todo);
          },
        ));
  }
}

class TodoView extends StatelessWidget {
  final newTodo todo;
  TodoView(this.todo);

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
