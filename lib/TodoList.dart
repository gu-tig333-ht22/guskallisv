import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class todoList extends StatelessWidget {
  final List<newTodo> list;

  const todoList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            list.map((newTodo todo) => _todoItem(context, todo)).toList());
  }

  Widget _todoItem(context, newTodo todo) {
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
            state.clearTodo(todo);
          },
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: todo.isCompleted,
        onChanged: (value) {
          state.updatingTodo(todo);
        },
      ),
    );
  }
}
