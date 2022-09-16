import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTodoView.dart';
import 'TodoList.dart';
import 'model.dart';

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mina To-Do'),
        actions: [
          PopupMenuButton(
              onSelected: (int value) {
                if (value != null)
                  Provider.of<MyState>(context, listen: false)
                      .setFilterBy(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Alla'), value: 1),
                    PopupMenuItem(child: Text('Genomförda'), value: 2),
                    PopupMenuItem(child: Text('Ej genomförda'), value: 3)
                  ]),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            todoList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newItem = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTodoView(newTodo(message: ''))));
          if (newItem != null) {
            Provider.of<MyState>(context, listen: false).addTodo(newItem);
          }
        },
      ),
    );
  }

  List<newTodo> _filterList(list, value) {
    if (value == 1) return list;
    if (value == 2)
      return list.where((todo) => todo.isCompleted == true).toList();
    else if (value == 3)
      return list.where((todo) => todo.isCompleted == false).toList();

    return list;
  }
}
