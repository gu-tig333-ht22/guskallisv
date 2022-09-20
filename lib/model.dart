import 'package:flutter/material.dart';

class newTodo {
  String message;
  bool isCompleted;

  newTodo({required this.message, this.isCompleted = false});

  void todoCompleted(newTodo) {
    isCompleted = !isCompleted;
  }
}

class MyState extends ChangeNotifier {
  late List<newTodo> _list = [];
  int _filterBy = 3;

  List<newTodo> get list => _list;

  int get filterBy => _filterBy;

  void setFilterBy(int filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  void addTodo(newTodo todo) {
    _list.add(todo);
    notifyListeners();
  }

  void removeTodo(newTodo todo) {
    _list.remove(todo);
    notifyListeners();
  }

  void isCompleted(newTodo todo) {
    todo.todoCompleted(todo);
    notifyListeners();
  }
}
