import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model.dart';

class internetFetcher {
  static Future<List<newTodo>> addTodo(newTodo todo) async {
    Map<String, dynamic> obj = newTodo.toJson(todo);
    var jsonString = jsonEncode(obj);
    var response = await http.post(
      Uri.parse(
          "https://todoapp-api.apps.k8s.gu.se/todos?key=7c0c522e-ce94-4fb4-8a99-fd0204e28bf7"),
      body: jsonString,
      headers: {'Content-Type': 'application/json'},
    );
    jsonString = response.body;
    var list = jsonDecode(jsonString);
    return list.map<newTodo>((data) {
      return newTodo.fromJson(data);
    }).toList();
  }

  static Future deleteTodo(String todoId) async {
    var response = await http.delete(Uri.parse(
        "https://todoapp-api.apps.k8s.gu.se/todos/$todoId?key=7c0c522e-ce94-4fb4-8a99-fd0204e28bf7"));
    var jsonString = response.body;
    var list = jsonDecode(jsonString);

    return list.map<newTodo>((data) {
      return newTodo.fromJson(data);
    }).toList();
  }

  static Future updateTodo(String todoId, newTodo todo) async {
    Map<String, dynamic> obj = newTodo.toJson(todo);
    var jsonString = jsonEncode(obj);
    var response = await http.put(
      Uri.parse(
          "https://todoapp-api.apps.k8s.gu.se/todos/$todoId?key=7c0c522e-ce94-4fb4-8a99-fd0204e28bf7"),
      body: jsonString,
      headers: {'Content-Type': 'application/json'},
    );
    jsonString = response.body;
    var list = jsonDecode(jsonString);

    return list.map<newTodo>((data) {
      return newTodo.fromJson(data);
    }).toList();
  }

  static Future<List<newTodo>> fetchTodos() async {
    http.Response response = await http.get(Uri.parse(
        "https://todoapp-api.apps.k8s.gu.se/todos?key=7c0c522e-ce94-4fb4-8a99-fd0204e28bf7"));
    var jsonData = response.body;
    var obj = jsonDecode(jsonData);
    return obj.map<newTodo>((data) {
      return newTodo.fromJson(data);
    }).toList();
  }
}
