import 'package:flutter/material.dart';
import 'InternetFetcher.dart';

class newTodo {
  String message;
  bool isCompleted;
  String id;

  newTodo({required this.message, this.isCompleted = false, required this.id});

  void todoCompleted(newTodo todo) {
    isCompleted = !isCompleted;
  }

  static Map<String, dynamic> toJson(newTodo todo) {
    return {
      'title': todo.message,
      'done': todo.isCompleted,
    };
  }

  static newTodo fromJson(Map<String, dynamic> obj) {
    return newTodo(
      message: obj['title'],
      isCompleted: obj['done'],
      id: obj['id'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<newTodo> _list = [];
  int _filterBy = 0;

  List<newTodo> get list => _list;
  int get filterBy => _filterBy;

  Future getTodo() async {
    List<newTodo> list = await internetFetcher.fetchTodos();
    _list = list;
    notifyListeners();
  }

  void setFilterBy(int filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  void addTodo(newTodo todo) async {
    _list = await internetFetcher.addTodo(todo);
    notifyListeners();
  }

  void clearTodo(newTodo todo) async {
    _list = await internetFetcher.deleteTodo(todo.id);
    notifyListeners();
  }

  void updatingTodo(newTodo todo) async {
    todo.todoCompleted(todo);
    _list = await internetFetcher.updateTodo(todo.id, todo);
    notifyListeners();
  }

  void isCompleted(newTodo todo) {
    todo.todoCompleted(todo);
    notifyListeners();
  }
}
